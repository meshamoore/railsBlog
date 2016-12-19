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

post_content = <<~EOS
  Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod
  tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam,
  quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo
  consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse
  cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non
  proident, sunt in culpa qui officia deserunt mollit anim id est laborum.
EOS

Post.create(title: "post 1", content: post_content, user_id: mesha.id)
Post.create(title: "post 2", content: post_content, user_id: mesha.id)
Post.create(title: "post 3", content: post_content, user_id: zach.id)
Post.create(title: "post 4", content: post_content, user_id: zach.id)
Post.create(title: "post 5", content: post_content, user_id: christy.id)
Post.create(title: "post 6", content: post_content, user_id: christy.id)
Post.create(title: "post 7", content: post_content, user_id: justin.id)
Post.create(title: "post 8", content: post_content, user_id: justin.id)
Post.create(title: "post 9", content: post_content, user_id: other.id)
Post.create(title: "post 10", content: post_content, user_id: other.id)

Comment.destroy_all
zach.posts.first.comments.create(user_id: mesha.id, content: 'Dumb!')
zach.posts.first.comments.create(user_id: mesha.id, content: "You don't know what you're talking about!")
mesha.posts.first.comments.create(user_id: zach.id, content: "Your blog sucks!")
mesha.posts.first.comments.create(user_id: zach.id, content: "You are a teribble writer!")
christy.posts.first.comments.create(user_id: mesha.id, content: 'Great post!')
christy.posts.first.comments.create(user_id: zach.id, content: 'Boring post...')
justin.posts.first.comments.create(user_id: zach.id, content: 'Interesting blog post!')
