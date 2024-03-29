class StationsController < ApplicationController

  def index
    @user = current_user
    @visites = @user.visites.paginate(page: params[:page], per_page: 50)
    @percentage_visited = Visite.stations_visited_percent(@user)
    @stations = Station.all.where(voyageurs: "O").order(:departement, :name).paginate(page: params[:page], per_page: 80)
    @stations_grouped_by_department = {}
    @stations.each do |station|
      @stations_grouped_by_department[station.departement] ||= []
      @stations_grouped_by_department[station.departement] << station
    end
    if params[:query].present?
      @stations_grouped_by_department = @stations.where("name ILIKE ?", "%#{params[:query]}%").order(:num_departement).group_by(&:departement)
    end
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
