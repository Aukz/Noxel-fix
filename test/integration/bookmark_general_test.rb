require 'test_helper'

class BookmarkGeneralTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # end
  def setup
    @user = users(:test)
    @novel = novels(:praratitle)
    log_in_as(@user)
  end

  test "bookmarktest" do
    assert_difference "Bookmark.count", 1 do
      post bookmarks_path, params:{novel_id: @novel.id}
    end
  end

  test "unbookmarktest" do
    @user.bookmark(@novel)
    assert_difference "Bookmark.count", -1 do
      delete bookmark_path(@user.bookmarks.find_by(novel_id: @novel.id))
    end
  end
end
