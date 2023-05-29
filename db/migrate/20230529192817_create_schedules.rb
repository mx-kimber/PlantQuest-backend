class CreateSchedules < ActiveRecord::Migration[7.0]
  def change
    create_table :schedules do |t|
      t.integer :user_id
      t.integer :collected_plant_id
      t.datetime :watering_start_date

      t.timestamps
    end
  end
end
