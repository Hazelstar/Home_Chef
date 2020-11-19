class RemoveEndDateFromAvailabilities < ActiveRecord::Migration[6.0]
  def change
    remove_column :availabilities, :end_date, :datetime
  end
end
