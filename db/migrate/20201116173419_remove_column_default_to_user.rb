class RemoveColumnDefaultToUser < ActiveRecord::Migration[6.0]
  def change
    remove_column :users, :default
  end
end
