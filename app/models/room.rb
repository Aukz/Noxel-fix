class Room < ApplicationRecord
  has_many :messages
  belongs_to :receiver, class_name: "User"
  validates :sender_id, presence: true
  validates :receiver_id, presence: true
end