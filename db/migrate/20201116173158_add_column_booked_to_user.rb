class AddColumnBookedToUser < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :booked, :boolean
    add_column :users, :default, :false
  end
end
