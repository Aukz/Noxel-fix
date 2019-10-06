require 'test_helper'

class ImpressionsControllerTest < ActionDispatch::IntegrationTest

  def setup
    @user = users(:test)
    @story = stories(:three)
    @im =impressions(:impretest)
    @impression = @user.impressions.build(story_id: @story.id,content:"test")
  end

  test "vaild" do
    assert @impression.valid?
  end

  test "nologin invalid" do
    assert_no_difference "Impression.count" do
      post impressions_path, params: {impression:{user_id: @user.id,story_id: @story.id,content:"aaaa"}}
    end
    assert_redirected_to login_path
  end

  test "login valid" do
    log_in_as(@user)
    assert_difference "Impression.count" do
      post impressions_path, params: {impression:{story_id: @story.id,content:"aaaa"}}
    end
  end

  test "nologin update" do
      patch impression_url(@user), params: { impression: {user_id: @user.id,story_id: @story.id,content:"aaaa"}}
      assert_redirected_to login_path
  end



end
