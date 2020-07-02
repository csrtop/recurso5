json.extract! entrega, :id, :entregado, :fecha_entrega, :pedido_id, :created_at, :updated_at
json.url entrega_url(entrega, format: :json)
