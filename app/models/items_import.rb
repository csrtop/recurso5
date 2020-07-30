class ItemsImport
    include ActiveModel::Model
    require 'roo'

    attr_accessor :file, :pedido, :club_id
    


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
        header = spreadsheet.row(1) #fila 1 if encabezado
        #raise spreadsheet.row(1).to_s
        (2..spreadsheet.last_row).map do |i|
            row = Hash[[header, spreadsheet.row(i)].transpose]
            #puts "xx"+row.to_s
            #puts "otra"+row[1].to_s
            pedido = Pedido.find_by_orden(row["orden"]) || Pedido.new
            #pedido.attributes = row.to_hash
            pedido.orden = row["orden"]
            pedido.OMS = row["OMS"]
            pedido.no_items = row["no_items"]
            pedido.socio = row["socio"]
            pedido.fecha_orden = row["fecha_orden"]

            #busca la descripcion del estado y le coloca el estado_id
            @primerestado = Estado.where("descripcion = '#{row["estado_id"]}'").first
            vestado = @primerestado.no_estado
            #puts "imprimir primer estado"+vestado.to_s
            pedido.estado_id = vestado
            #fin busca descripcion del estado
            
            #raise current_user.club_id.to_s

            pedido.club_id = row["club_id"]
            #puts "eeeeeee"+pedido.orden.to_s
            #@current_user = current_user.club_id
            #pedido.club_id = current_user
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