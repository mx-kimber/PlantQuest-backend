class AddDaysToWaterToSchedules < ActiveRecord::Migration[7.0]
  def change
    add_column :schedules, :days_to_water, :integer
  end
end
