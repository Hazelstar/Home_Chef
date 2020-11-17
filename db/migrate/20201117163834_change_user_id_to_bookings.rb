class ChangeUserIdToBookings < ActiveRecord::Migration[6.0]
  def change
    rename_column :bookings, :booker, null: false, foreign_key: true
  end
end
