class CollectedPlant < ApplicationRecord
  belongs_to :user
  belongs_to :plant
  belongs_to :schedule
end
  
