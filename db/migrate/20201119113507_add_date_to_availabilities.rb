class AddDateToAvailabilities < ActiveRecord::Migration[6.0]
  def change
    add_column :availabilities, :date, :date
  end
end

