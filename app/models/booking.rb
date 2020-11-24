class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :cooker, class_name: "User"

  validates :number_of_meals, :start_date, presence: true

  def time_to_cook
    # 10 min preparation time + 30 min per meal
    "#{((10 + 30 * self.number_of_meals) / 60).floor}:#{(10 + 30 * self.number_of_meals) % 60} hour"
  end
end
