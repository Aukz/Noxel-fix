require 'test_helper'

class StaticPagesControllerTest < ActionDispatch::IntegrationTest



  test "should get home" do
    get root_path
    assert_response :success
    assert_select "title", "Noxel"
  end

  test "should get about" do
    get static_pages_about_path
    assert_response :success
  end

end
