class Booking < ApplicationRecord
  belongs_to :personality
  belongs_to :user
  has_one :review

  # validate :booking_date_cannot_be_in_the_past
  validates :personality_id, :user_id, presence: true

  scope :not_available, -> (date) { where(date: date) }

  # def booking_date_cannot_be_in_the_past
  #   if date.present? && date < Date.today
  #     errors.add(:date, "can't be in the past")
  #   end
  # end
end
