class SchedulesController < ApplicationController
  def index
    @schedules = current_user.schedules.includes(collected_plant: :plant.name)
    render :index
  end
  

  def show
    @schedule = Schedule.find(params[:id])
    render :show
  end 

  def create
    @collected_plant = CollectedPlant.find(params[:collected_plant_id])
    @schedule = @collected_plant.build_schedule(schedule_params)

    if @schedule.save
      render :show
    else
      render json: { errors: @schedule.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def update
    @schedule = Schedule.find_by(id: params[:id])

    if @schedule
      if @schedule.update(schedule_params)
        render :show
      else
        render json: { errors: @schedule.errors.full_messages }, status: :unprocessable_entity
      end
    else
      render json: { errors: ['Schedule not found'] }, status: :not_found
    end
  end

  def destroy
    @schedule = Schedule.find_by(id: params[:id])

    if confirm_destroy?
      @schedule.destroy
      render json: { message: "Schedule destroyed successfully" }
    else
      render json: { message: "Deletion canceled" }
    end
  end
  
  private
  
  def confirm_destroy?
    confirm_message = "Are you sure you want to delete this schedule?"
    confirmation = params[:confirm]
    confirmation == "true"
  end

  def schedule_params
    params.permit(:user_id, :collected_plant_id, :watering_start_date, :days_to_water)
  end
  
end


