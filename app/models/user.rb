class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  # has_one_attached :photo # need to activate Cloudinary

  validates :first_name, :last_name, :address, :phone_number, :email, :bio, :is_a_cook, presence: true, on: :update # :photo
  validates :email, :phone_number, uniqueness: true, on: :update
  validates :bio, length: { in: 50..300 }, on: :update
  # validates :price, presence: true, numericality: true, if: -> { User.where(is_a_cook: true) }

  has_many :bookings, dependent: :destroy
  has_many :availabilities, dependent: :destroy
end
