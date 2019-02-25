class Personality < ApplicationRecord
  belongs_to :user
  has_many :bookings

  validates :first_name, :last_name, :picture,
            :desired_gender, :desired_age, :bio, presence: true
  validates :first_name, :last_name, length: { minimum: 2 }
  validates :bio, length: { minimum: 100, maximum: 500 }
  validates :desired_age, numericality: { greater_than_or_equal_to: 18 }
  validates :desired_gender, inclusion: { in: ["male", "female", "other"] }
end
