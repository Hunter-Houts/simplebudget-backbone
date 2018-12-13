# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
user_test = User.create!(id: 1, username: "test", email: "test@test.com", password: "test", phonenumber: nil)
test_post = Post.create!(id: 1, title: "test post", body: "please ignore", user_id: user_test.id)
