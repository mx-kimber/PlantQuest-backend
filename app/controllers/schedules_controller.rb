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
end