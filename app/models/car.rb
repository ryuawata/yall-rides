class Car < ApplicationRecord
  belongs_to :user
  has_many :bookings
  validates :model, :make, :year, :description, :price, :location, presence: true
end
