wb = xlsx_package.workbook

wb.styles do |style|
project_heading = style.add_style(b: true, sz: 14)
heading = style.add_style(b: true)

wb.add_worksheet(orden: "Pedidos") do |sheet|
\# Add a title row
sheet.add_row ["Inventory Items"], style: project_heading
\# Add the date this was downloaded
sheet.add_row ["Downloaded at", Time.now.strftime("%b %-d, %Y")]
\# Add a blank row
sheet.add_row []
\# Create the header row
sheet.add_row ["ID", "Orden", "OMS", "no_items", "Socio", "Fecha_entrega", "ubicacion_id", "tipo_entrega_id", "responsable_id", "club_id"], style: heading
\# Create the database reference row
sheet.add_row ["id", "orden", "oms", "no_items", "socio", "fecha_entrega", "ubicacion_id", "tipo_entrega_id", "responsable_id", "club_id"], style: heading
\# Create entries for each item
@pedidos.each do |pedido|
sheet.add_row [pedido.id, pedido.orden, pedido.oms, pedido.no_items, pedido.Socio, pedido.Fecha_entrega, pedido.ubicacion_id, pedido.tipo_entrega_id, pedido.responsable_id, pedido.club_id]
end
end
end