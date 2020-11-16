class ChangedefaultBooleanColumnToUser < ActiveRecord::Migration[6.0]
  def change
    change_column :users, :is_a_cook, :boolean, default: false
  end
end
