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
  geocoded_by :location
  after_validation :geocode, if: :will_save_change_to_location?

  include PgSearch::Model
  pg_search_scope :search_by_car_details,
    against: [ :model, :make, :location ],
    using: {
      tsearch: { prefix: true }
    }
end
