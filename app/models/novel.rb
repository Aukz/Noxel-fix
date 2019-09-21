class Novel < ApplicationRecord
  has_many :stories, dependent: :destroy
  belongs_to :user
  default_scope -> { order(created_at: :desc)}
  validates :title, presence: true, length: {maximum: 120}
  validates :user_id, presence: true
end
