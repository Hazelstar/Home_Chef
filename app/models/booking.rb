class Booking < ApplicationRecord
<<<<<<< HEAD
  belongs_to :user

  validates :start_date, presence: true
  validates :number_of_meals, numericality: { only_integer: true, more_than_or_equal_to: 3 }
=======
  # belongs_to :user
  belong_to :cooker, class_name: "user"
  belongs_to :booker, class_name: "user"

  validates :number_of_meals, :start_date, presence: true
>>>>>>> a63c88c7f0e5b6205974489818bdadde2e98d01e
end
