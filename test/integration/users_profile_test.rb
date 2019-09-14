require 'test_helper'

class UsersProfileTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # end

  def setup
    @user = users(:test)
  end

  test "プロフィール 画面" do
    log_in_as(@user)
    get user_path(@user)
    assert_template "users/show"
    assert_select 'title', full_title(@user.name)
     assert_select 'h1', text: @user.name
     assert_select 'h1>img.gravatar'
     @user.novels.each do |novel|
     assert_match novel.title, response.body
     assert_match novel.description, response.body
   end
  end
end
