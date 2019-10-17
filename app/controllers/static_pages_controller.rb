class StaticPagesController < ApplicationController
  skip_before_action :static_home, only: [:home]
  def home
    novel_ids = Bookmark.group(:novel_id).order('count(novel_id) desc').limit(10).pluck(:novel_id)
    @ranks = []
    cnt = 0
    novel_ids.each do |id|
      @ranks[cnt] = Novel.find(id)
      cnt += 1
    end
  end

  def about
  end
end
