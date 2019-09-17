require 'test_helper'

class PictureEditTest < ActionDispatch::IntegrationTest

def setup
  @user =users(:test)
end



test "picture integration in picture" do
  log_in_as(@user)
  get new_picture_path
  assert_no_difference "Picture.count" do
    post  pictures_path, params: {picture:{title:"",category:""}}
  end
  pic = pictures(:firstpic)
  assert_select "div#error_explanation"
  assert_difference "Picture.count",1 do
    post  pictures_path, params: {picture:{title: pic.title,category: pic.category}}
  end
  assert_redirected_to user_path(@user)
  follow_redirect!
  assert_match pic.title, response.body
  get picture_path(pic)
  assert_match pic.title, response.body
  assert_match @user.name, response.body
  assert_select "a", text: "削除"
  assert_select "a", text: "編集"
  get picture_path(pictures(:otherpic))
  assert_select 'a', text: '削除', count: 0
end



end
