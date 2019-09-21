class Story < ApplicationRecord
  belongs_to :novel
  validates :title, presence: true, length: {maximum: 50}
  validates :novel_id, presence: true
end
