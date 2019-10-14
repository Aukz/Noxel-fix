class StaticPagesController < ApplicationController
  skip_before_action :static_home, only: [:home]
  def home
    @ranks =Novel.find(Bookmark.group(:novel_id).order('count(novel_id) desc').limit(10).pluck(:novel_id))
  end

  def about
  end
end
