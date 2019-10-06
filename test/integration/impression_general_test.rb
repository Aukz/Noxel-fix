require 'test_helper'

class ImpressionGeneralTest < ActionDispatch::IntegrationTest

  def setup
    @user = users(:test)
    @story = stories(:three)
    @impression = @user.impressions.create(story_id:@story.id,content:"aaaa")
  end

  test "impression integrasion" do
    log_in_as(@user)
    get  impression_story_path(@story)
    assert_template "stories/impression"
    assert_difference "Impression.count" do
      post impressions_path, params: {impression:{user_id: @user.id,story_id: @story.id,content:"aaaa"}}
    end
    assert_redirected_to impression_story_path(@story)
    get  edit_impression_path(@impression)
    assert_template "impressions/edit"
    content= "bbbb"
    patch impression_path(@impression), params:{impression:{story_id: @story.id,content:content}}
    assert_not flash.empty?
    @impression.reload
    assert_equal content, @impression.content
    assert_redirected_to impression_story_path(@story)
    follow_redirect!
    assert_difference "Impression.count", -1 do
      delete impression_path(@impression.id,story_id: @story.id)
    end



  end


end
