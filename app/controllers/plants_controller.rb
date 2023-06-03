class PlantsController < ApplicationController
  # before_action :authenticate_user
  
  def index
    @plants = Plant.all
    render :index
  end
 
  def create
    @plant = Plant.create(
      name: params[:name],
      description: params[:description],
      sun_amount: params[:sun_amount],
      days_to_water: params[:days_to_water],
    )
    render :show
  end
end
