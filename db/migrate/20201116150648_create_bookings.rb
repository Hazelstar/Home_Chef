class CreateBookings < ActiveRecord::Migration[6.0]
  def change
    create_table :bookings do |t|
      t.datetime :start_date, default: DateTime.current.midday
      t.datetime :end_date, default: DateTime.current.midday
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
