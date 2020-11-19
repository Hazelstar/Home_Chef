class AddEndHourToAvailabilities < ActiveRecord::Migration[6.0]
  def change
    add_column :availabilities, :end_hour, :time
  end
end
