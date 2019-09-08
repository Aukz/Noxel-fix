require 'test_helper'

class UsersLoginTest < ActionDispatch::IntegrationTest

  def setup
    @user = users(:test)
    @non_user =users(:non_activated)
  end

test "login failed" do
  get login_path
  assert_response :success
  post login_path, params:{session:{email:"",password:""}}
  assert_template "sessions/new"
  assert flash.any?
  get root_path
  assert flash.empty?
end

test "login infomation" do
  get login_path
  post login_path, params:{session:{email: @user.email,password:"password"}}
  assert_redirected_to @user
  follow_redirect!
  assert_select "a[href=?]", login_path, count: 0
  assert_select "a[href=?]", static_pages_about_path, count: 0
  assert_select "a[href=?]", user_path(@user)
  assert_select "a[href=?]", logout_path

end

test "logout user" do
  get login_path
  post login_path, params:{session:{email: @user.email,password:"password"}}
  assert is_logged_in?
  assert_redirected_to @user
  follow_redirect!
  delete logout_path
  assert_not is_logged_in?
  assert_redirected_to root_url
  delete logout_path
  follow_redirect!
  assert_select "a[href=?]", login_path
  assert_select "a[href=?]", static_pages_about_path
  assert_select "a[href=?]", new_user_path

end

test "ログインしたときのremembermeについて" do
  log_in_as(@user, remember_me: "1")
  assert_not_empty cookies["remember_token"]
  assert_equal cookies["remember_token"], assigns(:user).remember_token
end

test "ログインしたときのremembermeが１と０" do
  log_in_as(@user)
  delete logout_path
  log_in_as(@user, remember_me: "0")
  assert_empty cookies["remember_token"]
end

test "垢有効化してないユーザーの詳細ページにいけない" do
  log_in_as(@non_user)
  assert_not is_logged_in?
  get user_path(@non_user)
  assert_redirected_to root_path
end





















end
