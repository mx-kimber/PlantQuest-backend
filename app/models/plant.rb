class Plant < ApplicationRecord
  validates :name, presence: true
  validates :description, presence: true
  validates :sun_amount, presence: true
  validates :days_to_water, presence: true

  has_many :collected_plants
 
  has_many :schedules, through: :collected_plant
end
