class Story < ApplicationRecord
  belongs_to :novel
  has_rich_text :content
  validates :title, presence: true, length: {maximum: 50}
  validates :content, presence: true
  validates :novel_id, presence: true
end
