class CreatePlants < ActiveRecord::Migration[7.0]
  def change
    create_table :plants do |t|
      t.string :name
      t.text :description
      t.integer :sun_amount
      t.integer :days_to_water

      t.timestamps
    end
  end
end
