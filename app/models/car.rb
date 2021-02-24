class Car < ApplicationRecord
  belongs_to :user
  has_many :bookings, dependent: :destroy
  validates :model, presence: true
  validates :make, presence: true
  validates :year, presence: true
  validates :description, presence: true
  validates :price, presence: true
  validates :location, presence: true
  has_one_attached :photo
end
