class RemoveDaysToWaterFromPlants < ActiveRecord::Migration[7.0]
  def change
    remove_column :plants, :days_to_water, :integer
  end
end
