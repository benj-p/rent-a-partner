class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :personalities, dependent: :destroy
  has_many :bookings

  validates :first_name, :last_name, :email, :location, :age, :gender, :picture,
            :desired_gender, :desired_age, :bio, presence: true
  validates :email, uniqueness: true
  validates :first_name, :last_name, length: { minimum: 2 }
  validates :bio, length: { minimum: 100, maximum: 500 }
  validates :age, :desired_age, numericality: { greater_than_or_equal_to: 18 }
  validates :gender, :desired_gender, inclusion: { in: ["male", "female", "other"] }

  before_save :capitalize_name

  def capitalize_name
    first_name.capitalize!
    last_name.capitalize!
  end

  def email_required?
    false
  end
  def email_changed?
    false
  end
end
