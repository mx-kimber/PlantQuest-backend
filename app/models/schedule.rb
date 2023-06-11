class Schedule < ApplicationRecord
  belongs_to :user
  belongs_to :collected_plant

  validates :watering_start_date, presence: true
  validates :days_to_water, presence: true
  validates :user_id, presence: true
  validates :collected_plant_id, presence: true
end

