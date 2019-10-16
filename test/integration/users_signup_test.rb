require 'test_helper'

class UsersSignupTest < ActionDispatch::IntegrationTest

  def setup
    ActionMailer::Base.deliveries.clear
  end

  test "user failed" do
    get new_user_path
    assert_no_difference "User.count" do
    post users_path, params:{user:{name: "",email:"user@invalid",
                                   password:"foo",password_confirmation: "bar"}}
    end
    assert_template 'users/new'
    assert_select "div#error_explanation"
  end

  test "user success" do
    get new_user_path
    assert_difference "User.count",1 do
    post users_path, params:{user:{name: "user",email:"user@valid.com",
                                  password:"foobar", password_confirmation: "foobar"}}
    end
    assert_equal 1, ActionMailer::Base.deliveries.size
    user = assigns(:user)
    assert_not user.activated?
    # 有効化していない状態でログインしてみる
    log_in_as(user)
    assert_not is_logged_in?
    # 有効化トークンが不正な場合
    get edit_account_activation_path("invalid token", email: user.email)
    assert_not is_logged_in?
    # トークンは正しいがメールアドレスが無効な場合
    get edit_account_activation_path(user.activation_token, email: 'wrong')
    assert_not is_logged_in?
    # 有効化トークンが正しい場合
    get edit_account_activation_path(user.activation_token, email: user.email)
    assert user.reload.activated?
    follow_redirect!
    assert_template "users/show"
    assert flash.any?
    assert is_logged_in?
    assert_select  "h1", "user"

  end
end
