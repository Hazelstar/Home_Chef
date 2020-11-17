class Booking < ApplicationRecord
  # belongs_to :user
  belongs_to :cooker, class_name: "user"
  belongs_to :booker, class_name: "user"

  validates :number_of_meals, :start_date, presence: true
end
