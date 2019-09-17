class Picture < ApplicationRecord
  belongs_to :user
  default_scope -> { order(created_at: :desc)}
  validates :title, presence: true, length:{ maximum:70 }

  validates :category, presence: true
  validates :user_id, presence: true
  has_one_attached :picture

  def thumbnail
    picture.variant(resize: '100x100')
  end

  def main
    picture.variant(resize: '650x600')
  end
end
