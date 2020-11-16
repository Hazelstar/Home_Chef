class Availability < ApplicationRecord
  belongs_to :user

  validations :start_date, :end_date, presence: true
end
