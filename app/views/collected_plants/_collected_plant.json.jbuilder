json.extract! collected_plant, :id, :user_id, :custom_name, :notes, :users_image

json.plant do
  json.id collected_plant.plant.id
  json.name collected_plant.plant.name
  json.description collected_plant.plant.description
  json.sun_amount collected_plant.plant.sun_amount
  json.days_to_water collected_plant.plant.days_to_water
end

if collected_plant.schedule
  json.schedule do
    json.id collected_plant.schedule.id
    json.collected_plant_id collected_plant.schedule.collected_plant_id
    json.watering_start_date collected_plant.schedule.watering_start_date
  end
else
  json.schedule "No schedule available"
end
