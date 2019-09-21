require 'test_helper'

class NovelTest < ActiveSupport::TestCase

  def setup
    @user = users(:test)
    @novel = @user.novels.build(title: "タイトルなんだな",description: "説明なんだな")
  end

  test "vaild?" do
    assert @novel.valid?
  end

  test "user_id nil" do
    @novel.user_id = nil
    assert_not @novel.valid?
  end

  test "title presence" do
    @novel.title = " "
    assert_not @novel.valid?
  end

  test "title maximum" do
    @novel.title = "a"*119
    assert @novel.valid?
  end

  test "title maximum failed" do
    @novel.title = "a"*121
    assert_not @novel.valid?
  end

  test "user_id presence" do
    @novel.user_id = ""
    assert_not @novel.valid?
  end

  test "消したらstory一緒に消える" do
    @novel.save
    @story = @novel.stories.create(title:"aaaa")
    assert_difference "Story.count", -1 do
      @novel.destroy
    end
  end

# fixtureにtimes.doを追加したら最新が変わるからエラーがでた一応最新が上に来るようになっている
  # test "一番上に最新投稿が来る" do
  #   assert_equal novels(:firsttitle), Novel.first
  # end

end
