# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.destroy_all
User.create(username: "mesha", email: "foo@bar.com", password: "mesha")
User.create(username: "christy", email: "foo@bar.com", password: "christy")
User.create(username: "zach", email: "foo@bar.com", password: "zach")
User.create(username: "justin", email: "foo@bar.com", password: "justin")
User.create(username: "other", email: "foo@bar.com", password: "other")

Post.destroy_all
Post.create(title: "post 1", content: "This is post 1.", user_id: 1)
Post.create(title: "post 2", content: "This is post 2.", user_id: 1)
Post.create(title: "post 3", content: "This is post 3.", user_id: 1)
Post.create(title: "post 4", content: "This is post 4.", user_id: 2)
Post.create(title: "post 5", content: "This is post 5.", user_id: 3)
Post.create(title: "post 6", content: "This is post 6.", user_id: 3)
Post.create(title: "post 7", content: "This is post 7.", user_id: 4)
Post.create(title: "post 8", content: "This is post 8.", user_id: 4)
Post.create(title: "post 9", content: "This is post 9.", user_id: 4)
Post.create(title: "post 10", content: "This is post 10.", user_id: 5)

Comment.destroy_all
Comment.create(content: "Dumb.", user_id: 1, post_id: 1)
Comment.create(content: "Awesome post, Christy!", user_id: 2, post_id: 4)
Comment.create(content: "Stupid.", user_id: 3, post_id: 6)
Comment.create(content: "Whatever.", user_id: 4, post_id: 8)
Comment.create(content: "Hate it.", user_id: 5, post_id: 10)
