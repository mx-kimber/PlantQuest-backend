class Plant < ApplicationRecord
  validates :name, presence: true
  validates :description, presence: true
  validates :sun_amount, presence: true
  

  has_many :collected_plants
 
end
