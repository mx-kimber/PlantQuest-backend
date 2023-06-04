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

  def show
    @plant = Plant.find_by(id: params[:id])
    render :show
  end

  def update
    @plant = Plant.find_by(id: params[:id])
    @plant.update(
      name: params[:name] || @plant.name,
      description: params[:description] || @plant.description,
      sun_amount: params[:sun_amount] || @plant.sun_amount,
      days_to_water: params[:days_to_water] || @plant.days_to_water,
    )
   
    render :show
  end

  def destroy
    @plant = Plant.find_by(id: params[:id])
    if confirm_destroy?
      @plant.destroy
      render json: { message: "Plant destroyed successfully" }
    else
      render json: { message: "Deletion canceled" }
    end
  end
  
  private
  
  def confirm_destroy?
    confirm_message = "Are you sure you want to delete this plant?"
    confirmation = params[:confirm]
    confirmation == "true"
  end
  
  
end
