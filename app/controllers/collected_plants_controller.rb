class CollectedPlantsController < ApplicationController

  def index
    @collected_plants = CollectedPlant.all
    render :index
  end

  def show
    @collected_plant = CollectedPlant.find(params[:id])
    render :show
  end  
end
