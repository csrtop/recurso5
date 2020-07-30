json.extract! pedido, :id, :orden, :OMS, :no_items, :socio, :fecha_orden, :club_id, :created_at, :updated_at, :estado_id
json.url pedido_url(pedido, format: :json)
