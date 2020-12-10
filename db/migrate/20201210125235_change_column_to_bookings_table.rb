class ChangeColumnToBookingsTable < ActiveRecord::Migration[6.0]
  def change
    remove_column :bookings, :price_cents

    add_monetize :bookings, :amount, currency: { present: false }
    add_column :bookings, :state, :string, :default => "pending", :null => false
    add_column :bookings, :checkout_session_id, :string
  end
end
