class Review < ApplicationRecord
  belongs_to :car

  validates :rating, presence: true
  validates :comment, presence: true
end
