class Personality < ApplicationRecord
  belongs_to :user
  has_many :bookings, dependent: :destroy

  mount_uploader :picture, PictureUploader

  validates :first_name, :last_name, :picture,
            :desired_gender, :desired_age, :bio, :price_per_day, presence: true
  validates :first_name, :last_name, length: { minimum: 2 }
  validates :bio, length: { minimum: 100, maximum: 500 }
  validates :price_per_day, numericality: { greater_than_or_equal_to: 1 }
  validates :desired_age, numericality: { greater_than_or_equal_to: 18 }
  validates :desired_gender, inclusion: { in: ["male", "female", "other"] }

  scope :price, -> (price_level) {
      if price_level == 1
        where ("personalities.price_per_day BETWEEN 1 AND 19")
      elsif price_level == 2
        where ("personalities.price_per_day BETWEEN 20 AND 49")
      elsif price_level == 3
        where ("personalities.price_per_day BETWEEN 50 AND 100")
      elsif price_level == 4
        where ("personalities.price_per_day BETWEEN 101 AND 9999999999")
      end }
  #User.where({ created_at: (Time.now.midnight - 1.day)..Time.now.midnight })
  #price levels: ['£1 - £19', 1], ['£20 - £49', 2], ['£50 - £100', 3], ['£100 +', 4]]))
  scope :match_search_terms, -> (query) { where("personalities.first_name LIKE ? OR personalities.last_name LIKE ? OR personalities.bio LIKE ?", "%#{query}%", "%#{query}%", "%#{query}%") if query.present? }
  scope :gender, -> (gender) { joins(:user).merge(User.gender(gender)) if gender.present?}
  scope :location, -> (location) { joins(:user).merge(User.location(location)) if location.present?}
end
