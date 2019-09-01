require 'test_helper'

class UsersSignupTest < ActionDispatch::IntegrationTest

  test "user failed" do
    get new_user_path
    assert_no_difference "User.count" do
    post users_path, params:{user:{name: "",email:"user@invalid",
                                   password:"foo",password_confirmation: "bar"}}
    end
    assert_template 'users/new'
    assert_select "div#error_explanation"
    assert_select  "ul",3
  end

  test "user success" do
    get new_user_path
    assert_difference "User.count",1 do
    post users_path, params:{user:{name: "user",email:"user@valid.com",
                                  password:"foobar", password_confirmation: "foobar"}}
    end
    follow_redirect!
    assert_template "users/show"
    assert flash.any?
    assert is_logged_in?
    assert_select "title", "user"
    assert_select  "h1", "user"
  end
end
