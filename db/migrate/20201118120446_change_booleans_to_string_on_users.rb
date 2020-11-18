class ChangeBooleansToStringOnUsers < ActiveRecord::Migration[6.0]
  def change
    change_column :users, :is_a_cook, :string, :default => "false", :null => false
    change_column :users, :booked, :string, :default => "false", :null => false
  end
end
