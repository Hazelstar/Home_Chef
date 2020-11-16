class Booking < ApplicationRecord
  belongs_to :user

  validates :start_date, presence: true
  validates :number_of_meals, numericality: { only_integer: true, more_than_or_equal_to: 3 }
end
