class Bookmark < ApplicationRecord
    belongs_to :user
    belongs_to :novel
    validates :user_id, presence: true
    validates :novel_id, presence: true
end
