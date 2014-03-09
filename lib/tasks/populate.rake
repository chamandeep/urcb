
namespace :db do
desc "Fill database with sample data"
task populate: :environment do
make_users
make_posts
end
end
require 'faker'

def make_posts
  users = User.all(limit: 6)
  50.times do
    postText = Faker::Lorem.sentence(5)
    users.each { |user| user.Posts.create!(postText: postText) }
  end
end

def make_users
User.create!(firstName:     "Example User",
lastName: "surname",
email: "example@urcb.co.uk",
password: "grover",
password_confirmation: "grover")
99.times do |n|
firstName = Faker::Name.first_name
lastName = Faker::Name.last_name
email = "example-#{n+1}@urcb.co.uk"
password  = "grover"
password_confirmation  = "grover"
User.create!(firstName:     firstName,
lastName: lastName,
email:    email,
password: password,
password_confirmation: password)
end
end

def make_friendships
  users = User.all
  user  = users.first
  followed_users = users[2..15]
  followers      = users[2..15]
  followed_users.each { |followed| user.follow!(followed) }
  followers.each      { |follower| follower.follow!(user) }
end
