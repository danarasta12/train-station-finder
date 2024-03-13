class Visite < ApplicationRecord
  belongs_to :user
  belongs_to :station

  validates :user_id, uniqueness: { scope: :station_id, message: "Vous avez déjà visité cette gare" }

  def self.stations_visited_percent(user)
    total_stations = Station.all.count
    total_visites = user.visites.count
    percentage_visited = ((total_visites.to_f / total_stations) * 100).round(2)
  end
end
