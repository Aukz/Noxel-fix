require 'test_helper'

class PicturesControllerTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # end
  def setup
    @user = users(:test)
    @picture = pictures(:firstpic)
  end

  test "no login create" do
    assert_no_difference "Picture.count" do
      post  pictures_path, params: {picture: {title:"aaaa",picture: "a.jpg",category:"fantagy"}}
    end
    assert_redirected_to login_url
  end

  test "no login destroy" do
    assert_no_difference "Picture.count" do
      delete picture_path(@picture)
    end
    assert_redirected_to login_url
  end

  test "create picture" do
    log_in_as(@user)
    assert_difference "Picture.count", 1 do
      post pictures_path, params: {picture:{title:"editman", category:"foobar"}}
    end
    assert_redirected_to user_path(@user)
  end

  test "destroy picture" do
    log_in_as(@user)
    assert_difference "Picture.count",-1 do
      delete picture_path(@picture)
    end
    assert_redirected_to user_path(@user)
  end

  test "otheruser picture delete" do
    log_in_as(@user)
    other = pictures(:otherpic)
    assert_no_difference "Picture.count" do
      delete picture_path(other)
    end
    assert_redirected_to user_path(@user)
  end



end
