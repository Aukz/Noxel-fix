class Story < ApplicationRecord
  belongs_to :novel
  has_rich_text :content
  has_many :impressions, dependent: :destroy
  has_many :user_impressions, through: :impressions, source: :user
  validates :title, presence: true, length: {maximum: 50}
  validates :content, presence: true
  validates :novel_id, presence: true
end
