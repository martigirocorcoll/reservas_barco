json.extract! booking, :id, :fecha_inicio, :fecha_final, :barco, :nom, :contacte, :preu, :canal, :observacions, :created_at, :updated_at
json.url booking_url(booking, format: :json)
