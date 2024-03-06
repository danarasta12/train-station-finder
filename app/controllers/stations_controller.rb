class StationsController < ApplicationController

  def index
    @stations = Station.all
    @stations_grouped_by_department = Station.all.group_by(&:departement)
    @visite = Visite.new

  end

  def show
    @station = Station.find(params[:id])
  end

  def create
    @station = Station.new(stations_params)
    if @station.save
      redirect_to station_path(@station)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def new
    @station = Station.new
  end

  private

  def stations_params
    params.require(:station).permit(:name, :code_uic, :ville, :departement)
  end
end
