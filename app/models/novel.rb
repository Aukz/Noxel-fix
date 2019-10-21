class Novel < ApplicationRecord
  has_many :stories, dependent: :destroy
  has_many :bookmarks, dependent: :destroy
  has_many :user_bookmark, through: :bookmarks, source: :user
  belongs_to :user
  has_many :tags, dependent: :destroy
  default_scope -> { order(created_at: :desc)}
  validates :title, presence: true, length: {maximum: 120}
  validates :user_id, presence: true



  def self.search(search)
    where(['title LIKE ?', "%#{search}%"])
  end
end
