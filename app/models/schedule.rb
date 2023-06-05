class Schedule < ApplicationRecord
  belongs_to :user
  belongs_to :collected_plant

  validates :watering_start_date, presence: true
  validate :valid_watering_start_date

  private

  def valid_watering_start_date
    errors.add(:watering_start_date, "must be a future date") if watering_start_date.present? && watering_start_date <= Date.today
  end
end

