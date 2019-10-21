class Tag < ApplicationRecord
  belongs_to :novel
  # validate :tag_limit
  #
  # def tag_limit
  #   if self.novel.tags.(:reload).count >= 5
  #   end
  # end
end
