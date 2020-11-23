class CreateAvailabilities < ActiveRecord::Migration[6.0]
  def change
    create_table :availabilities do |t|
      t.datetime :start_date
      t.datetime :end_date
      t.date :event_date
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
