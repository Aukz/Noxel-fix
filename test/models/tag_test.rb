require 'test_helper'

class TagTest < ActiveSupport::TestCase

  def setup
    @tag = Tag.create(name:"testです", novel_id:novels(:noveltest).id)
  end

  test "vaild" do
    assert @tag.valid?
  end

  test "name_presence" do
    @tag.name = nil
    assert_not @tag.valid?
  end

  test "name_length 16" do
    @tag.name = "aaaaaaaaaaaaaaaa"
    assert_not @tag.valid?
  end

  test "name_length 15" do
    @tag.name = "aaaaaaaaaaaaaaa"
    assert @tag.valid?
  end
end
