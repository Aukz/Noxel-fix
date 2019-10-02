require 'test_helper'

class BookmarksControllerTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # end
  def setup
    @user = users(:test)
    @novel = novels(:praratitle)
  end

  test "loginなしでブックマーク" do
    assert_no_difference "Bookmark.count" do
      post bookmarks_path
    end
    assert_redirected_to login_url
  end

  test "loginなしでブックマーク削除" do
    assert_no_difference "Bookmark.count" do
      delete bookmark_path(bookmarks(:bm1))
    end
    assert_redirected_to login_url
  end


end
