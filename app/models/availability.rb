class Availability < ApplicationRecord
  # belongs_to :user
  belongs_to :cooker, class_name: "user"

  validations :start_date, :end_date, presence: true
end
