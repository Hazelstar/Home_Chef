class Availability < ApplicationRecord
  belongs_to :user
#  belongs_to :cooker, class_name: "user"

  validates :event_date, :start_hour, :end_hour, presence: true
end
