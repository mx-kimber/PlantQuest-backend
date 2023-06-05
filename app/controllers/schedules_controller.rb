class SchedulesController < ApplicationController
  def index
    @schedules = Schedule.all
    render :index
  end

  def show
    @schedule = Schedule.find(params[:id])
    render :show
  end
 
  def create
    @user = current_user
    @collected_plant = @user.collected_plants.find(params[:collected_plant_id])
    @schedule = @collected_plant.build_schedule(schedule_params)

    if @schedule.save
      render json: @schedule, status: :created
    else
      render json: { errors: @schedule.errors.full_messages }, status: :unprocessable_entity
    end
  end

  private

  def schedule_params
    params.require(:schedule).permit(:watering_start_date)
  end
end