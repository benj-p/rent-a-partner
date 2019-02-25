class Booking < ApplicationRecord
  belongs_to :personality
  belongs_to :user

  validate :booking_date_cannot_be_in_the_past
  validates :personality_id, :user_id, presence: true

  def booking_date_cannot_be_in_the_past
    if date.present? && date < Date.today
      errors.add(:date, "can't be in the past")
    end
  end
end
