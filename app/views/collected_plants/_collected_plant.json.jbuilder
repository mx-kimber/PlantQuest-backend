json.extract! collected_plant, :id, :user_id, :custom_name, :notes, :users_image
json.plant do
  json.id collected_plant.plant.id
  json.name collected_plant.plant.name
  json.description collected_plant.plant.description
  json.sun_amount collected_plant.plant.sun_amount
  json.days_to_water collected_plant.plant.days_to_water
end
