class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :first_name, :last_name, :address, :phone_number, :email, :password, :bio, :is_a_cook, presence: true
  validates :email, :phone_number, uniqueness: true
  validates :is_a_cook, inclusion: { in: [true, false] }
  validates :bio, length: { in: 50..300 }
  validates :price, presence: true, numericality: true, if: -> { current_user.is_a_cook? }
  validates :booked, presence: true, if: -> { current_user.is_a_cook? }

  has_many :bookings, dependent: :destroy
  has_many :availabilities, dependent: :destroy
end
