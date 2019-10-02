class BookmarksController < ApplicationController
    before_action :logged_in_user

  def create
    @novel = Novel.find(params[:novel_id])
    current_user.bookmark(@novel)
    redirect_to @novel
  end

  def destroy
    @novel = Bookmark.find(params[:id]).novel
    current_user.unbookmark(@novel)
    redirect_to @novel

  end

end
