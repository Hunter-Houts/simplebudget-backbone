# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
user_test = User.create!(id: 1, username: "test", email: "test@test.com", password: "test")
test_post = Post.create!(id: 1, title: "test post", body: "please ignore", user_id: user_test.id)
test_post = Post.create!(id: 2, title: "test post 2", body: "please ignore again", user_id: user_test.id)
review_test = Review.create!(id:1, body: "test review", rating: 5, user_id: user_test.id)
test_account = Account.create!(id:1, income: 2000, option: 1, user_id: user_test.id)
bills_test = Bill.create!(id:1, name: 'test', amount: 100.00, user_id: user_test.id)

