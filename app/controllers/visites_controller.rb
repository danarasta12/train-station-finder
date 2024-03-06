class VisitesController < ApplicationController
  before_action :authenticate_user!, only: [:create, :destroy]
  before_action :set_station, only: %i[new create]

  def new
    @visite = Visite.new
  end

  def create
    @visite = Visite.new(visite_params)
    @visite.station = @station
    @visite.user = current_user
    if @visite.save
      redirect_to stations_path, notice: 'Votre visite a bien été enregistrée ! Continuez de voyager'
    else
      redirect_to stations_path, alert: "La visite n'a pas été enregistrée."
    end
  end

  def edit
  end

  def destroy
    @visite = current_user.visites.find_by(station: @station)
    if @visite.present?
      @visite.destroy
      redirect_to stations_path, notice: 'Visite supprimée.'
    else
      redirect_to stations_path, alert: "Vous n'avez pas encore visité cette gare."
    end
  end

  def update
  end

  def index
    @user = current_user
    @visites = @user.visites
  end

  def show
  end

  private

  def set_station
    @station = Station.find(params[:station_id])
  end

  def visite_params
    params.require(:visite).permit(:completed)
  end
end
