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
    assert_no_difference 'Story.count' do
      post stories_path, params: { story: { title: nil,content: nil},novel_id: novel.id}
    end
    assert_difference 'Story.count' do
      post stories_path, params: { story: { title: "foobar",content: "aaaa"},novel_id: novel.id}
    end
    assert_redirected_to novel_path(novel.id)
    follow_redirect!
    assert_select 'a', text: 'foobar', count: 1
    get novel_path(novels(:praratitle))
    assert_select 'a', text: '話を書く', count: 0
  end

end
