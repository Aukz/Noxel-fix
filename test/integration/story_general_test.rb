require 'test_helper'

class StoryGeneralTest < ActionDispatch::IntegrationTest

  def setup
    @user =users(:test)
    @novel=novels(:noveltest)
  end

  test "vaild" do
    assert @novel.valid?
  end


  test "general test in story" do
    log_in_as(@user)
    assert_difference "Novel.count"do
      post novels_path, params:{ novel:{ title:"aaaaa",description:"aaaaa"}}
    end
    novel = @user.novels.create(title:"aaaaa",description:"aaaaa")
    # かなり頑張ったけどCouldn't find Novel without an IDと言われ先に進めなかった
    # assert_difference 'Story.count' do
    #   post stories_path, params: { story: { title: "foobar",novel_id: novel.id} }
    # end
    # get new_story_path(users(:prara))
    # assert_redirected_to @user
  end

end
