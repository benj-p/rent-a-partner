class Personality < ApplicationRecord
  belongs_to :user
  has_many :bookings, dependent: :destroy

  validates :first_name, :last_name, :picture,
            :desired_gender, :desired_age, :bio, :price_per_day, presence: true
  validates :first_name, :last_name, length: { minimum: 2 }
  validates :bio, length: { minimum: 100, maximum: 500 }
  validates :price_per_day, numericality: { greater_than_or_equal_to: 1 }
  validates :desired_age, numericality: { greater_than_or_equal_to: 18 }
  validates :desired_gender, inclusion: { in: ["male", "female", "other"] }

  # scope :price_per_day, -> (price_per_day) { where price_per_day: price_per_day }
  scope :match_search_terms, -> (query) { where("first_name LIKE ? OR last_name LIKE ? OR bio LIKE ?", "%#{query}%", "%#{query}%", "%#{query}%") if query.present? }
  scope :gender, -> (gender) { joins(:user).merge(User.gender(gender)) if gender.present?}
  scope :location, -> (location) { joins(:user).merge(User.location(location)) if location.present?}
end
