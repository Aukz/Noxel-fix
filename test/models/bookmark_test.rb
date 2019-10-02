require 'test_helper'

class BookmarkTest < ActiveSupport::TestCase

def setup
  @bookmark = Bookmark.create(user_id: users(:test).id,
                              novel_id: novels(:praratitle).id)
end

test "vaild" do
  assert @bookmark.valid?
end

test "user_id presence" do
  @bookmark.user_id = nil
  assert_not @bookmark.valid?
end

test "novel_id presence" do
  @bookmark.novel_id = nil
  assert_not @bookmark.valid?
end

end
