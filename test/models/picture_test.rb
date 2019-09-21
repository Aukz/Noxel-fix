require 'test_helper'

class PictureTest < ActiveSupport::TestCase

  def setup
    @user = users(:test)
    @picture = @user.pictures.build(title:"絵だよ",category:"ファンタジー")
  end

  test "valid" do
    assert @picture.valid?
  end

  test "title presence" do
    @picture.title = nil
    assert_not @picture.valid?
  end

  test "title maximum" do
    @picture.title = "a"*69
    assert @picture.valid?
  end

  test "title maximum+1" do
    @picture.title = "a"*71
    assert_not @picture.valid?
  end


  test "category presence" do
    @picture.category = nil
    assert_not @picture.valid?
  end

  test "user_id presence" do
    @picture.user_id = nil
    assert_not @picture.valid?
  end

  test "新しいやつが上に来る" do
    assert_equal pictures(:otherpic), Picture.first
  end





end
