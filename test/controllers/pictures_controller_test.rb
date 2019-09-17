require 'test_helper'

class PicturesControllerTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # end
  def setup
    @picture = pictures(:firstpic)
  end

  test "no login create" do
    assert_no_difference "Picture.count" do
      post  pictures_path, params: {picture: {title:"aaaa",category:"fantagy"}}
    end
    assert_redirected_to login_url
  end

  test "no login destroy" do
    assert_no_difference "Picture.count" do
      delete picture_path(@picture)
    end
    assert_redirected_to login_url
  end
end
