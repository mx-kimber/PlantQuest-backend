class CollectedPlant < ApplicationRecord
  belongs_to :user
  belongs_to :plant
  has_one :schedule

  validates :user_id, presence: true
  validates :plant_id, presence: true
  validates :custom_name, presence: true
  validates :notes, presence: true
  validates :users_image, presence: true
end
  
