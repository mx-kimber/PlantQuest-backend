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
    @schedule = Schedule.create(
      user_id: params[:user_id],
      collected_plant_id: params[:collected_plant_id],
      watering_start_date: params[:watering_start_date],
    )
    if @schedule.save
      render :show
    else
      render json: {errors: @schedule.errors.full_messages}, status: :unprocessable_entity
    end
  end

  def update
    @schedule = Schedule.find_by(id: params[:id])
    if @schedule.update(
      user_id: params[:user_id] || @schedule.user_id,
      collected_plant_id: params[:collected_plant_id] || @schedule.collected_plant_id,
      watering_start_date: params[:watering_start_date] || @schedule.watering_start_date,
    )
      render :show
    else
      render json: { errors: @schedule.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def destroy
    @schedule = Schedule.find_by(id: params[:id])
    if confirm_destroy?
      @schedule.destroy
      render json: { message: "schedule destroyed successfully" }
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
end