require 'test_helper'

class NovelsInterfaceTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # end
  def setup
    @user = users(:test)
    @other = users(:prara)
  end

  test "ノベルインターフェイス" do
    log_in_as(@user)
    get new_novel_path
    assert_no_difference 'Novel.count' do
      post novels_path, params: { novel: { title: "" } }
    end
    assert_select "div#error_explanation"
    assert_difference 'Novel.count' do
      post novels_path, params: { novel: { title: "foobar" } }
    end
    assert_redirected_to @user
    follow_redirect!
    assert_match "foobar", response.body
    novel = @user.novels.first
    get novel_path(novel)
    assert_difference 'Novel.count', -1 do
      delete novel_path(novel)
    end
    get novel_path(@user.novels.first)
      assert_select 'a', text: '小説削除', count: 1
      assert_select 'a', text: '小説削除', count: 1
    get novel_path(@other.novels.first)
      assert_select 'a', text: '小説削除', count: 0
      assert_select 'a', text: '小説削除', count: 0

  end

end
