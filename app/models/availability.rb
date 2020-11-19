class Availability < ApplicationRecord
  belongs_to :user
#  belongs_to :cooker, class_name: "user"

  validates :event_date, :start_hour, :end_hour, presence: true

  def good_availability_format
    self.event_date.nil? ? "No date specified" : "#{self.event_date.strftime("%d of %B, %Y")} from #{self.start_hour.strftime("%k:%M")} to #{self.end_hour.strftime("%k:%M")}"
  end
end
