class Review < ApplicationRecord
  belongs_to :user
  belongs_to :personality
  belongs_to :booking

  validates :booking_id, uniqueness: true
  validates :user_rating, :personality_rating, numericality: true, inclusion: { in: [1, 2, 3, 4, 5] }, allow_blank: true
  validates :user_comment, :personality_comment, length: { minimum: 1 }, allow_blank: true

  RATING = [1, 2, 3, 4, 5]
end
