class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :car
  validates :start_date, :end_date, presence: true
  enum status: [ :pending, :confirmed, :rejected ]
end
