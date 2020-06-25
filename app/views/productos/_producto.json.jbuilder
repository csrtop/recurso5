json.extract! producto, :id, :item, :descripcion, :pasillo, :club_id, :created_at, :updated_at
json.url producto_url(producto, format: :json)
