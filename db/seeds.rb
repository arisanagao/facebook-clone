# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

10.times do |n|
  email = Faker::Internet.email
  name = Faker::Name.name
  password = "password"
  User.create!(email: email,
               password: password,
               password_confirmation: password,
               name: name,
               uid: SecureRandom.uuid
               )
end


n = 1
comment_num = 1
while n <= 10
  content = Faker::Lorem.sentence
  Post.create!(
    content: content,
    user_id: n
  )
  while comment_num <= 5
    comment_content = Faker::Lorem.sentence
    Comment.create!(
      content: comment_content,
      user_id: rand(10)+1,
      post_id: n
    )
  comment_num = comment_num + 1
  end 
  n = n + 1
  comment_num = 1
end


User.create!(email:"arisa@ntt",
             password: "arisa1",
             password_confirmation: "arisa1",
             name: "Arisa",
             uid: SecureRandom.uuid)
