class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable


  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  mount_uploader :picture, PictureUploader

  has_many :personalities, dependent: :destroy
  has_many :bookings, dependent: :destroy

  validates :first_name, :last_name, :email, :location, :age, :gender, :picture,
            :bio, presence: true
  validates :email, uniqueness: true
  validates :first_name, :last_name, length: { minimum: 2 }
  validates :bio, length: { minimum: 100, maximum: 500 }
  validates :age, numericality: { greater_than_or_equal_to: 18 }
  validates :desired_age, numericality: { greater_than_or_equal_to: 18 }, allow_blank: true
  validates :gender, inclusion: { in: ["male", "female", "other"] }
  validates :desired_gender, inclusion: { in: ["male", "female", "other"] }, allow_blank: true

  scope :gender, -> (gender) { where gender: gender.downcase }
  scope :location, -> (location) { where location: location }

  before_save :capitalize_name

  GENDER = ["male", "female", "other"]
  AGE = (18..99).to_a

  def capitalize_name
    first_name.capitalize!
    last_name.capitalize!
  end
end
