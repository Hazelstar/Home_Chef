class ChangeColumnToUsers < ActiveRecord::Migration[6.0]
  def change
    add_monetize :users, :price, currency: { present: false }
    remove_column :users, :booked
  end
end
