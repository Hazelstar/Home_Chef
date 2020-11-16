class AddBookedColumnToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :booked, :boolean, default: false
  end
end
