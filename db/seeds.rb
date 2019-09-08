# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create!(name:  "test",
             email: "test1234@example.com",
             password:              "testtest",
             password_confirmation: "testtest",
             status: 2,
             activated: true,
             activated_at: Time.zone.now)


User.create!(name:  "Example1 User",
             email: "testman1@example.com",
             password:              "foobar",
             password_confirmation: "foobar",
             activated: true,
             activated_at: Time.zone.now)


User.create!(name:  "Example2 User",
             email: "testman2@example.com",
             password:              "foobar",
             password_confirmation: "foobar",
             activated: true,
             activated_at: Time.zone.now)


User.create!(name:  "Example3 User",
             email: "testman3@example.com",
             password:              "foobar",
             password_confirmation: "foobar",
             activated: true,
             activated_at: Time.zone.now)


User.create!(name:  "Example4 User",
             email: "testman4@example.com",
             password:              "foobar",
             password_confirmation: "foobar",
             activated: true,
             activated_at: Time.zone.now)


User.create!(name:  "Example5 User",
             email: "testman5@example.com",
             password:              "foobar",
             password_confirmation: "foobar",
             activated: true,
             activated_at: Time.zone.now)
