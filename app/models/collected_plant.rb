class CollectedPlant < ApplicationRecord
  belongs_to :user
  belongs_to :plant
  has_one :schedule
end
  
