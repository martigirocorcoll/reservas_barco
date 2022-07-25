class AddPreunetToBookings < ActiveRecord::Migration[6.0]
  def change
    add_column :bookings, :preunet, :integer
  end
end
