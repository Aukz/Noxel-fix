class Tag < ApplicationRecord
  belongs_to :novel
  validates :name, presence: true, length:{ maximum:15 }
end
