class Review < ApplicationRecord
  belongs_to :car
  belongs_to :user

  validates :rating, presence: true
  validates :user, uniqueness: {scope: :car}
  # validates :comment, presence: true
end
