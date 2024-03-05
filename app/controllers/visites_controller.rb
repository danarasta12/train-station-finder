class VisitesController < ApplicationController
  def new
    @visite = Visite.new
  end

  def create
    @visite = Visite.new(visite_params)
    @station = Station.find(params[:station_id])
    @visite.station = @station
    @visite.user = User.first
      if @visite.save
        redirect_to stations_path, notice: 'Visite was successfully created.'
      else
        # Handle validation errors or other cases where the visite couldn't be saved
        redirect_to stations_path, alert: 'Visite could not be created.'
      end
  end

  def edit
  end

  def destroy
  end

  def update
  end

  def index
  end

  def show
  end

  private

  def visite_params
    params.require(:visite).permit(:completed?, :station_id, :user_id)
  end
end
