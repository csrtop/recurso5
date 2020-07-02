json.extract! pedido, :id, :orden, :OMS, :no_items, :socio, :fecha_orden, :ubicacion_id, :tipo_entrega_id, :responsable_id, :club_id, :created_at, :updated_at
json.url pedido_url(pedido, format: :json)
