class ChangeDefaultBooleanColumnBookedToUser < ActiveRecord::Migration[6.0]
  def change
    change_column :users, :booked, :boolean, default: false
  end
end
