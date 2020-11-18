class AddStartDateToAvailabilities < ActiveRecord::Migration[6.0]
  def change
    add_column :availabilities, :start_date, :datetime
  end
end
