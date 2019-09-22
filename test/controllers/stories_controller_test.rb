require 'test_helper'

class StoriesControllerTest < ActionDispatch::IntegrationTest

  def setup
    @user = users(:test)
    @novel = novels(:noveltest)
    @story = @novel.stories.create(title:"aaaa",content:"aaaa")
  end

  test "loginなしで投稿" do
    assert_no_difference "Story.count" do
      post stories_path params:{story:{title:"aaaaa",content:"foobar"}}
    end
    assert_redirected_to login_path
  end

  test "loginなしで削除" do
    assert_no_difference "Story.count" do
      delete story_path(@story)
    end
    assert_redirected_to login_path
  end

  test "loginなしで改変" do
    assert_no_difference "Story.count" do
      patch story_path(@story)
    end
    assert_redirected_to login_path
  end













end
