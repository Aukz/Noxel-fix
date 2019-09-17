require 'test_helper'

class UserTest < ActiveSupport::TestCase
  def setup
    @user = User.new(name: "example user", email: "user@example.com",
                 password: "foobar", password_confirmation: "foobar")
  end

  test "vaild" do
    assert @user.valid?
  end

  test " name present" do
    @user.name = "     "
    assert_not @user.valid?
  end

  test "name length" do
    @user.name ="a"*51
    assert_not @user.valid?
  end

  test "email presence" do
    @user.email = "    "
    assert_not @user.valid?
  end

  test "email length" do
    @user.email = "a"*244 +"@exsample.com"
    assert_not @user.valid?
  end

  test "email vaild address" do
    valid_addresses = %w[user@example.com USER@foo.COM A_US-ER@foo.bar.org
                     first.last@foo.jp alice+bob@baz.cn test@google.com]
    valid_addresses.each do |valid_address|
        @user.email = valid_address
        assert @user.valid?, "#{valid_address.inspect} should be valid"
    end
  end

  test "email invaild adress" do
    invalid_addresses = %w[user@example,com user_at_foo.org user.name@example.
                           foo@bar_baz.com foo@bar+baz..com]
    invalid_addresses.each do |invalid_address|
      @user.email = invalid_address
      assert_not @user.valid?, "#{invalid_address.inspect} should be invalid"
    end
  end

  test "email address unique" do
    duplicate_user = @user.dup
    duplicate_user.email = @user.email.upcase
    @user.save
    assert_not duplicate_user.valid?
  end

  test "email downcase" do
    mixemail = "TesTasededagW@ExaMple.coM"
    @user.email = mixemail
    @user.save
    assert_equal mixemail.downcase, @user.email
  end

  test "password presence" do
    @user.password = @user.password_confirmation = "     "
    assert_not @user.valid?
  end

  test "password length" do
    @user.password = @user.password_confirmation = "a"*5
    assert_not @user.valid?
  end

  test "authenticated? test" do
    assert_not @user.authenticated?(:remember,"")
  end

  test "ユーザー消えたら投稿きえる" do
    @user.save
    @user.novels.create!(title:"aaaaa")
    assert_difference "Novel.count", -1 do
      @user.destroy
    end
  end

  test "ユーザー消えたら投稿きえる(画像ver)" do
    @user.save
    @user.pictures.create!(title:"aaaaa",picture: "a.jpg" ,category:"fantagy")
    assert_difference "Picture.count", -1 do
      @user.destroy
    end
  end

  test "followとunfollow user" do
    test = users(:test)
    prara =users(:prara)
    assert_not test.following?(prara)
    test.follow(prara)
    assert test.following?(prara)
    assert prara.followers.include?(test)
    test.unfollow(prara)
    assert_not test.following?(prara)
  end

end
