# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


User.destroy_all
m = User.create(name: "mesha", email: "foo@bar.com", password: "mesha")
c = User.create(name: "christy", email: "foo@bar.com", password: "christy")
z = User.create(name: "zach", email: "foo@bar.com", password: "zach")
j = User.create(name: "justin", email: "foo@bar.com", password: "justin")
o = User.create(name: "other", email: "foo@bar.com", password: "other")

m.follow(c)
c.follow(m)
z.follow(c)
z.follow(m)
j.follow(m)
j.follow(c)
j.follow(z)
o.follow(m)

Post.destroy_all
Post.create(title: "post 1", content: "This is post 1.", user_id: User.first.id)
Post.create(title: "post 2", content: "This is post 2.", user_id: User.first.id)
Post.create(title: "post 3", content: "This is post 3.", user_id: User.first.id)
Post.create(title: "post 4", content: "This is post 4.", user_id: User.first.id)
Post.create(title: "post 5", content: "This is post 5.", user_id: User.first.id)
Post.create(title: "post 6", content: "This is post 6.", user_id: User.first.id)
Post.create(title: "post 7", content: "This is post 7.", user_id: User.first.id)
Post.create(title: "post 8", content: "This is post 8.", user_id: User.first.id)
Post.create(title: "post 9", content: "This is post 9.", user_id: User.first.id)
Post.create(title: "post 10", content: "This is post 10.", user_id: User.first.id)
c.posts.create(title: "Christy's Post!", content: 'This is a post!')

Comment.destroy_all
Comment.create(content: "Dumb.", user_id: User.first.id, post_id: Post.first.id)
Comment.create(content: "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam!", user_id: User.first.id, post_id: Post.first.id)
Comment.create(content: "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam!", user_id: User.first.id, post_id: Post.first.id)
Comment.create(content: "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam!", user_id: User.first.id, post_id: Post.first.id)
Comment.create(content: "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam!", user_id: User.first.id, post_id: Post.first.id)
Comment.create(content: "Awesome post, Christy!", user_id: User.first.id, post_id: Post.first.id)
Comment.create(content: "Stupid.", user_id: User.first.id + 2, post_id: Post.first.id)
Comment.create(content: "Whatever.", user_id: User.first.id + 3, post_id: Post.first.id)
Comment.create(content: "Hate it.", user_id: User.first.id + 4, post_id: Post.first.id)
