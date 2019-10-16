# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create!(name:  "テストユーザー",
             email: "test1234@example.com",
             password:              "testtest",
             password_confirmation: "testtest",
             status: 2,
             activated: true,
             activated_at: Time.zone.now)


User.create!(name:  "斎藤",
             email: "testman1@example.com",
             password:              "foobar",
             password_confirmation: "foobar",
             activated: true,
             activated_at: Time.zone.now)


User.create!(name:  "高橋",
             email: "testman2@example.com",
             password:              "foobar",
             password_confirmation: "foobar",
             activated: true,
             activated_at: Time.zone.now)


User.create!(name:  "ジョセフ",
             email: "testman3@example.com",
             password:              "foobar",
             password_confirmation: "foobar",
             activated: true,
             activated_at: Time.zone.now)


User.create!(name:  "四番目のユーザー",
             email: "testman4@example.com",
             password:              "foobar",
             password_confirmation: "foobar",
             activated: true,
             activated_at: Time.zone.now)


User.create!(name:  "ペンギン",
             email: "testman5@example.com",
             password:              "foobar",
             password_confirmation: "foobar",
             activated: true,
             activated_at: Time.zone.now)

users = User.order(:created_at).take(5)
10.times do
  title ="タイトルのサンプルです"
  description = "これは説明のサンプルとして書かれています"
  users.each do |user|
    user.novels.create(title: title, description: description)
    description += "!"
  end
end
  users = User.all
  user = User.first
  following = users[2..6]
  followers = users[3..5]
  following.each {|followed| user.follow(followed)}
  followers.each {|follower| follower.follow(user)}

# AWSで以下のseedが聞かなかったため、コメントアウト

# user = User.first
# second = User.second
# three = User.third
#
# user.novels.create!(title:"月夜",
#                     description:"一夜一夜に人見ごろは語呂合わせにも使いますね")
#
# user.novels.create!(title:"雪月花",
#                     description:"雪月花ってなに？")
#
# second.novels.create!(title:"月光花",
#                       description:"ブラックジャック")
#
# three.novels.create!(title:"花水木",
#                      description:"花水木はなんかの別名")
#
# three.novels.create!(title:"桜花爛漫",
#                      description:"桜の花が満開になることです！")
#
# user_novels = User.first.novels.order(:created_at).take(3)
# users = User.all
# bookmark_user = users[2..5]
# bookmark_user.each {|br| br.bookmark(user_novels)}
# user =User.second
# first = User.first.novels.order(:created_at).take(1)
# user.bookmark(first)
#
# user_novels = User.second.novels.order(:created_at).take(1)
# users = User.all
# bookmark_user = users[2..4]
# bookmark_user.each {|br| br.bookmark(user_novels)}
#
# user_novels = User.third.novels.order(:created_at).take(2)
# users = User.all
# bookmark_user = users[0..3]
# bookmark_user.each {|br| br.bookmark(user_novels)}
