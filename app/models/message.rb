class Message < ApplicationRecord
  belongs_to :chatroom
  belongs_to :user

  # validates :content, pensence: true, allow_blank: false
end
