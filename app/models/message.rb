class Message < ApplicationRecord
  belongs_to :room
  validates :content, presence: true, length: {maximum: 255}
  validates :sender_id, presence: true
  validates :receiver_id, presence: true
end
