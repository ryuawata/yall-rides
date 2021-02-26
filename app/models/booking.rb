class Booking < ApplicationRecord
	enum status: [:pending, :confirmed, :rejected]
  belongs_to :user
  belongs_to :car
  has_many :reviews, through: :car
  validates :start_date, presence: true
  validates :end_date, presence: true
end
