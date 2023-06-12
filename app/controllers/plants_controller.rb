class PlantsController < ApplicationController
  before_action :authenticate_user
  # before_action :require_login

  def index
    @plants = Plant.all
    render :index
  end

  def create
    @plant = Plant.create(plant_params)
    if @plant.save
      render :show
    else
      render json: { errors: @plant.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def show
    @plant = Plant.find_by(id: params[:id])
    render :show
  end

  def update
    @plant = Plant.find_by(id: params[:id])
    if @plant.update(plant_params)
      render :show
    else
      render json: { errors: @plant.errors.full_messages }, status: :unprocessable_entity
    end
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

  def plant_params
    params.permit(:name, :description, :sun_amount)
  end

  def confirm_destroy?
    @confirm_message = "Are you sure you want to delete this plant?"
    confirmation = params[:confirm]
    confirmation == "true"
  end
end

