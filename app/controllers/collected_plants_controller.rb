class CollectedPlantsController < ApplicationController

  def index
    @collected_plants = CollectedPlant.all
    render :index
  end

  def create
    @collected_plant = CollectedPlant.new(
      user_id: params[:user_id],
      plant_id: params[:plant_id],
      custom_name: params[:custom_name],
      notes: params[:notes],
      users_image: params[:users_image].presence || Plant.find(params[:plant_id]).users_image
    )
  
    if @collected_plant.save
      render :show
    else
      render json: { errors: @collected_plant.errors.full_messages }, status: :unprocessable_entity
    end
  end
  

  def show
    @collected_plant = CollectedPlant.find(params[:id])
    render :show
  end  
end
