class Visite < ApplicationRecord
  belongs_to :user
  belongs_to :station

  validates :user_id, uniqueness: { scope: :station_id, message: "Vous avez déjà visité cette gare" }
end
