require 'test_helper'

class RelationshipTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  def setup
    @relation = Relationship.new(follower_id: users(:test).id,
                                 followed_id: users(:prara).id)
  end

  test "有効か？" do
    assert @relation.valid?
  end
# バリデーション書かなくてもグリーンになるバリデーションが省略されている可能性がある
  test "follower_id presence" do
    @relation.follower_id = " "
    assert_not @relation.valid?
  end

  test "followed_id presence" do
    @relation.followed_id = nil
    assert_not @relation.valid?
  end


end
