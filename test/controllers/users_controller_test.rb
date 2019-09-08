require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest

  def setup
    @user = users(:test)
    @other = users(:prara)
  end

  test "new_user" do
    get new_user_url
    assert_response :success
  end

  test "should get index" do
    log_in_as(@user)
    get users_url
    assert_response :success
  end

  test "should get new" do
    get new_user_url
    assert_response :success
  end

  test "should create user" do
    assert_difference('User.count') do
      post users_url, params: { user: { name: @user.name, email: "aaaaa@example.com" ,password:"password", password_confirmation: "password" } }
    end
  end

  test "should show user" do
    get user_url(@user)
    assert_response :success
  end

  test "should get edit" do
    log_in_as(@user)
    get edit_user_url(@user)
  end

  test "should update user" do
    log_in_as(@user)
    patch user_url(@user), params: { user: { email: @user.email, name: @user.name, password_digest: @user.password_digest } }
    assert_redirected_to user_url(@user)
  end

  test "should destroy user" do
    assert_difference('User.count', -1) do
      delete user_url(@user)
    end

    assert_redirected_to root_url
  end

  test "should redirect edit when not logged in" do
    get edit_user_path(@user)
    assert_not flash.empty?
    assert_redirected_to login_url
  end

  test "should redirect update when not logged in" do
    patch user_path(@user), params: { user: { name: @user.name,
                                              email: @user.email } }
    assert_not flash.empty?
    assert_redirected_to login_url
  end

  test "正しくないユーザー" do
    log_in_as(@other)
    get edit_user_path(@user)
    assert_not flash.empty?
    assert_redirected_to user_path(@other)
  end

  test "正しいユーザー" do
    log_in_as(@user)
    get edit_user_path(@user)
    assert flash.empty?
    assert_response :success
  end

  test "ログインして無いとindexアクセスできない" do
    get users_path
    assert_not flash.empty?
    get login_url
  end

  test "ユーザー消す" do
    log_in_as(@user)
      assert_difference "User.count",-1 do
        delete user_path(@user)
        assert_not flash.empty?
        assert_redirected_to root_url
    end
    end

end
