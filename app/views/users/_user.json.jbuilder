
json.keys do 
  json.user_id user.id
end
json.name user.name
json.email user.email
json.profile_image user.profile_image


if user.schedules.present?
  json.schedules user.schedules do |schedule|
    json.plant_name schedule.collected_plant.custom_name || schedule.collected_plant.plant.name    
    json.days_to_water schedule.days_to_water
    json.watering_start_date schedule.watering_start_date
    json.keys do 
      json.user_collected_plant_id schedule.collected_plant.user_id
      json.collected_plant_id schedule.collected_plant.id
    end
  end
else
  json.schedules "No schedules available"
end

if user.collected_plants.present?
  json.collected_plants user.collected_plants do |collected_plant|
    json.custom_name collected_plant.custom_name || collected_plant.plant.name
    json.keys do 
      json.collected_plant_id collected_plant.id
      json.user_collected_plant_id collected_plant.user_id
    end
    
    


    if collected_plant.schedule.present?
      json.schedule do       
        json.keys do 
          json.schedule_id collected_plant.schedule.id
          json.collected_plant_id collected_plant.schedule.collected_plant_id
        end
        json.days_to_water collected_plant.schedule.days_to_water
        json.watering_start_date collected_plant.schedule.watering_start_date
        
      end
    else
      json.schedule "No schedules available"
    end
  end
else
  json.collected_plants "No collected plants available"
end