require 'test_helper'

class StoryTest < ActiveSupport::TestCase

  def setup
    @story =stories(:storyone)
  end

  # test "valid" do
  #   assert @story.valid?
  # end

  test "title presence" do
    @story.title = nil
    assert_not @story.valid?
  end

  test "titile maximum over" do
    @story.title ="a"*51
    assert_not @story.valid?
  end

  test "novel_id presence" do
    @story.novel_id = nil
    assert_not @story.valid?
  end



end
