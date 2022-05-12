class CreateBookings < ActiveRecord::Migration[6.0]
  def change
    create_table :bookings do |t|
      t.datetime :fecha_inicio
      t.datetime :fecha_final
      t.string :barco
      t.string :nom
      t.string :contacte
      t.integer :preu
      t.string :canal
      t.text :observacions

      t.timestamps
    end
  end
end
