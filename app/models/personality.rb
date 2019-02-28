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
  scope :match_search_terms, -> (query) { where("personalities.first_name ILIKE ? OR personalities.last_name ILIKE ? OR personalities.bio ILIKE ?", "%#{query}%", "%#{query}%", "%#{query}%") if query.present? }
  scope :gender, -> (gender) { joins(:user).merge(User.gender(gender)) if gender.present? }
  scope :location, -> (location) { joins(:user).merge(User.location(location)) if location.present? }
  scope :not_available, -> (date) { joins(:bookings).merge(Booking.not_available(date))}
  # scope :available, -> (date) { where.not(Personality.not_available(date)) if date.present? }
  scope :excluding, -> (*values) {
  where(
    "#{table_name}.id NOT IN (?)",
      (
        values.compact.flatten.map { |e|
          if e.is_a?(Integer)
            e
          else
            e.is_a?(self) ? e.id : raise("Element not the same type as #{self}.")
          end
        } << 0
      )
    )
  }


  # def self.available
  #   Personality.joins(:bookings).where(bookings: { created_at: time_range })
  # end

end
