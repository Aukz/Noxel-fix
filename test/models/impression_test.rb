require 'test_helper'

class ImpressionTest < ActiveSupport::TestCase

  def setup
    @impre = Impression.create(content: "testtt",user_id: users(:test).id,story_id: stories(:two).id)
  end

  test "vaild" do
    assert @impre.valid?
  end

  test "content presence" do
    @impre.content = nil
    assert_not @impre.valid?
  end

  test "user_id presence" do
    @impre.user_id = nil
    assert_not @impre.valid?
  end

  test "story_id presence" do
    @impre.story_id = nil
    assert_not @impre.valid?
  end

end
