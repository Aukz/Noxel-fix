require 'test_helper'

class NovelsControllerTest < ActionDispatch::IntegrationTest

  def setup
    @novel = novels(:secondtitle)
  end

  test "loginなしで新規投稿" do
    assert_no_difference "Novel.count" do
      post novels_path, params: {novel:{title:"aaaaa"}}
    end
    assert_redirected_to login_path
  end

  test "loginなしで投稿消す" do
    assert_no_difference "Novel.count" do
      delete novel_path(@novel)
    end
    assert_redirected_to login_path
  end


  test "別のユーザーの投稿消す" do
    log_in_as(users(:test))
    novel = novels(:praratitle)
    assert_no_difference "Novel.count" do
      delete novel_path(novel)
    end
    assert_redirected_to user_path(users(:test))
  end

end
