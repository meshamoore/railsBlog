# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


User.destroy_all

mesha = User.create(name: "mesha", email: "mesha@bar.com", password: "mesha")
christy = User.create(name: "christy", email: "christy@bar.com", password: "christy")
zach = User.create(name: "zach", email: "zach@bar.com", password: "zach")
justin = User.create(name: "justin", email: "justin@bar.com", password: "justin")
other = User.create(name: "other", email: "other@bar.com", password: "other")

mesha.follow(christy)
christy.follow(mesha)
zach.follow(christy)
zach.follow(mesha)
justin.follow(mesha)
justin.follow(christy)
justin.follow(zach)
other.follow(justin)

Post.destroy_all
Post.create(title: "post 1", content: "This is post 1.", user_id: mesha.id)
Post.create(title: "post 2", content: "This is post 2.", user_id: mesha.id)
Post.create(title: "post 3", content: "This is post 3.", user_id: zach.id)
Post.create(title: "post 4", content: "This is post 4.", user_id: zach.id)
Post.create(title: "post 5", content: "This is post 5.", user_id: christy.id)
Post.create(title: "post 6", content: "This is post 6.", user_id: christy.id)
Post.create(title: "post 7", content: "This is post 7.", user_id: justin.id)
Post.create(title: "post 8", content: "This is post 8.", user_id: justin.id)
Post.create(title: "post 9", content: "This is post 9.", user_id: other.id)
Post.create(title: "post 10", content: "This is post 10.", user_id: other.id)

Comment.destroy_all
zach.posts.first.comments.create(user_id: mesha.id, content: 'Dumb!')
zach.posts.first.comments.create(user_id: mesha.id, content: "You don't know what you're talking about!")
mesha.posts.first.comments.create(user_id: zach.id, content: "Your blog sucks!")
mesha.posts.first.comments.create(user_id: zach.id, content: "You are a teribble writer!")
christy.posts.first.comments.create(user_id: mesha.id, content: 'Great post!')
christy.posts.first.comments.create(user_id: zach.id, content: 'Boring post...')
justin.posts.first.comments.create(user_id: zach.id, content: 'Interesting blog post!')
