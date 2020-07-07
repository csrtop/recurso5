class ItemsImport
    include ActiveModel::Model
    require 'roo'

    attr_accessor :file

    def initialize(attributes={})
        attributes.each { |orden, value| send("#{orden}=", value) }
    end

    def persisted?
        false
    end

    def open_spreadsheet
        case File.extname(file.original_filename)
            when ".csv" then CSV.new(file.path)
            when ".xls" then Roo::Excel.new(file.path)
            when ".xlsx" then Roo::Excelx.new(file.path)
        else raise "Unknown file type: #{file.original_filename}"
        end
    end

    def load_imported_items
        spreadsheet = open_spreadsheet
        header = spreadsheet.row(1)
        (2..spreadsheet.last_row).map do |i|
            row = Hash[[header, spreadsheet.row(i)].transpose]
            pedido = Pedido.find_by_orden(row["orden"]) || Pedido.new
            pedido.attributes = row.to_hash
            pedido
        end
    end

    
    def imported_items
        @imported_items ||= load_imported_items
    end

    def save
        if imported_items.map(&:valid?).all?
            imported_items.each(&:save!)
            true
        else
            imported_items.each_with_index do |pedido, index|
                pedido.errors.full_messages.each do |msg|
                    errors.add :base, "Row #{index + 2}: #{msg}"
                end
            end
            false
        end
    end
end