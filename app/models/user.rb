class User < ApplicationRecord
  has_secure_password
  validates :email, presence: true, uniqueness: true
  validates :name, presence: true
  validates :password, presence: true, length: { minimum: 6 }
  
  has_many :collected_plants
  has_many :schedules, through: :collected_plants
  
  # has_many :plants, through: :collected_plants
end
