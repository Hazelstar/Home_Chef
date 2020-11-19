class AddStartHourToAvailabilities < ActiveRecord::Migration[6.0]
  def change
    add_column :availabilities, :start_hour, :time
  end
end
