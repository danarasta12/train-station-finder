class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
    @stations = Station.all
  end

  def train_stations
    table = CSV.parse(File.read("liste-des-gares.csv"), headers: true)
  end
end
