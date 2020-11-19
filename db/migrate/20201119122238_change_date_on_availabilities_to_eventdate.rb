class ChangeDateOnAvailabilitiesToEventdate < ActiveRecord::Migration[6.0]
  def change
     rename_column :availabilities, :date, :event_date
  end
end
