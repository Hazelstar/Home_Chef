class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :first_name, :last_name, :address, :phone_number, :email, :password, :bio, :is_a_cook, presence: true
  validates :email, uniqueness: true
  validates :is_a_cook, inclusion: { in: [true, false] }
  validates :bio, length: { in: 50..300 }
  validates :price, numericality: true, presence: true # if: is_a_cook:true
end
