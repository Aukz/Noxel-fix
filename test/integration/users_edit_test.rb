require 'test_helper'

class UsersEditTest < ActionDispatch::IntegrationTest

  def setup
    @user = users(:test)
  end

  test "edit failed" do
    log_in_as(@user)
    get edit_user_path(@user)
    assert_template "users/edit"
    patch user_path(@user), params:{user:{name:"",email:"",
                                          password:  "foo",
                                          password_confirmation: "bar" }}
    assert_template "users/edit"
    assert_select "div.alert", "The form contains 5 errors."
  end

  test "edit success" do
    log_in_as(@user)
    get edit_user_path(@user)
    assert_template "users/edit"
    name = "foobar"
    email = "foo@bar.com"
    patch user_path(@user), params:{user:{name: name,
                                          email: email,
                                          password:  "",
                                          password_confirmation: "" }}
    assert_not flash.empty?
    assert_redirected_to @user
    @user.reload
    assert_equal name, @user.name
    assert_equal email, @user.email

  end

  test "edit success with frendlyforwared" do
    get edit_user_path(@user)
    assert_not_nil session[:forwarding_url]
    log_in_as(@user)
    assert_redirected_to edit_user_url(@user)
    assert session[:forwarding_url].nil?
    name = "foobar"
    email = "foo@bar.com"
    patch user_path(@user), params:{user:{name: name,
                                          email: email,
                                          password:  "",
                                          password_confirmation: "" }}
    assert_not flash.empty?
    assert_redirected_to @user
    @user.reload
    assert_equal name, @user.name
    assert_equal email, @user.email

  end
end
