class Station < ApplicationRecord
  validates :name, presence: true
  validates :code_uic, presence: true, numericality: { only_integer: true }
  validates :ville, presence: true
  validates :departement, presence: true

  has_many :visites, dependent: :destroy
end
