json.keys do 
  json.collected_plant_id collected_plant.id
  json.user_collected_plant_id collected_plant.user.id
  json.schedule_id collected_plant.schedule.id
  json.api_plant_id collected_plant.plant.id
  end
json.plant_name collected_plant.custom_name || collected_plant.plant.name
json.user_name collected_plant.user.name
json.sun_amount collected_plant.plant.sun_amount
json.description collected_plant.plant.description

if collected_plant.schedule.present?
  json.schedule do
    json.schedule_id collected_plant.schedule.id
    json.watering_start_date collected_plant.schedule.watering_start_date
    json.days_to_water collected_plant.schedule.days_to_water
  end
else
  json.schedule "No schedule available"
end

  json.plant do
  json.name collected_plant.plant.name
end





