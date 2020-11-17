class AddCookerToBookings < ActiveRecord::Migration[6.0]
  def change
    add_reference :bookings, :cooker, foreign_key: { to_table: :users }
  end
end
