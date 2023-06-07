class CollectedPlantsController < ApplicationController
  def index
    @collected_plants = current_user.collected_plants
    render :index
  end

  def create
    @collected_plant = current_user.collected_plants.build(collected_plant_params)

    if @collected_plant.save
      create_or_update_schedule
      render :show
    else
      render json: { errors: @collected_plant.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def show
    @collected_plant = CollectedPlant.find(params[:id])
    render :show
  end

  def update
    @collected_plant = CollectedPlant.find_by(id: params[:id])

    if @collected_plant
      if @collected_plant.update(collected_plant_params)
        create_or_update_schedule
        render :show
      else
        render json: { errors: @collected_plant.errors.full_messages }, status: :unprocessable_entity
      end
    else
      render json: { errors: ['Collected Plant not found'] }, status: :not_found
    end
  end

  def destroy
    @collected_plant = CollectedPlant.find_by(id: params[:id])

    if @collected_plant
      if confirm_destroy?
        @collected_plant.destroy
        render json: { message: "Collected plant destroyed successfully" }
      else
        render json: { message: "Deletion canceled" }
      end
    else
      render json: { message: "Collected Plant not found" }, status: :not_found
    end
  end

  private

  def confirm_destroy?
    confirm_message = "Are you sure you want to delete this collected plant?"
    confirmation = params[:confirm]
    confirmation == "true"
  end

  def collected_plant_params
    params.permit(:custom_name, :notes, :users_image, :plant_id)
  end

  def schedule_params
    params.permit(:watering_start_date, :days_to_water)
  end

  def create_or_update_schedule
    schedule = @collected_plant.schedule
    if schedule.present?
      schedule.update(schedule_params)
    else
      @collected_plant.create_schedule(schedule_params)
    end
  end
end


