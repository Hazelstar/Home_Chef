class RemoveStartDateFromAvailabilities < ActiveRecord::Migration[6.0]
  def change
    remove_column :availabilities, :start_date, :datetime
  end
end
