require 'test_helper'

class SiteLayoutTest < ActionDispatch::IntegrationTest

  test "layout link" do
    get root_path
    assert_select "a[href=?]", root_path
    assert_select "a[href=?]", static_pages_about_path
    assert_select "a[href=?]", new_user_path
    get static_pages_about_path
    assert_select "title", full_title("About")
    get new_user_path
    assert_response :success
    assert_select "title", full_title("新規登録")
  end
end
