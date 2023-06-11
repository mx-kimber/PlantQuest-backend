class CollectedPlant < ApplicationRecord
  belongs_to :user
  belongs_to :plant
  has_one :schedule

  accepts_nested_attributes_for :schedule
  accepts_nested_attributes_for :plant

  validates :user_id, presence: true
  validates :plant_id, presence: true

  def build_schedule(schedule_params)
    self.schedule = Schedule.new(schedule_params)
  end
end

  
# validates :custom_name, presence: true
  # validates :notes, presence: true
  # validates :users_image, presence: true