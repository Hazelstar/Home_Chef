class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_one_attached :photo

  validates :first_name, :last_name, :address, :phone_number, :email, :bio, :is_a_cook, presence: true, on: :update # :photo
  validates :email, :phone_number, uniqueness: true, on: :update
  validates :bio, length: { in: 20..300 }, on: :update
  # validates :price, presence: true, numericality: true, if: -> { User.where(is_a_cook: true) }
  validates :is_a_cook, inclusion: { in: %w(true false),
    message: "%{value} is not a valid selection" }
  has_many :bookings, dependent: :destroy
  has_many :availabilities, dependent: :destroy

  include PgSearch::Model
  pg_search_scope :search, # <- you can name your method
    against: [:first_name, :last_name, :address, :bio, :favorite_utensil],
    using: {
    tsearch: { prefix: true }
    }
  has_many :messages, dependent: :destroy
  has_many :chatrooms, -> { distinct }, through: :messages

  def is_a_cook?
    self.is_a_cook == "true"
  end
end

