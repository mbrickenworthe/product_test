# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

elon = User.create(name: "Elon", inventor: true, email: "musk@tesla.com", password: "Falcon12")
trump = User.create(name: "Donald", inventor: true, email: "real_donald@trump.com", password: "GoldToilet")

anon = User.create(name: "Anonymous", email: "anon@anon.com", password: "Secret99")

giant_wall = Product.create(name: "Giant Wall", price: 10000000000.00, description: "Build a giant wall across the US-Mexican border to keep out the illegal aleins. It could totally be done and it would be awesome!", user: trump)

self_driving_car = Product.create(name: "Autonomous Car", price: 45000.00, description: "Cars that can drive themselves to and from locations without needing a driver assistance. It'll use cameras, GPS, and my own unique software. The future is five years away.", user: elon)

elon_post = Post.create(title: "Elon's Self-Driving Car", rating: 5, article: "Cars that can drive themselves to and from locations without needing a driver assistance. It'll use cameras, GPS, and my own unique software. The future is five years away.", product: self_driving_car, user: elon)

trump_post = Post.create(title: "Trump's Great Wall of Mexico", rating: -7, article: "Build a giant wall across the US-Mexican border to keep out the illegal aleins. It could totally be done and it would be awesome!", product: giant_wall, user: trump)

Comment.create(content: "That would be a terrible idea for foreign relations", post: trump_post, user: anon)

Comment.create(content: "Love it! That's the only way to stop people from stealing our jobs and creating terrorism!!", post: trump_post)

Comment.create(content: "I'll believe when I see it. And I do hope that's in a couple years", post: elon_post)

Comment.create(content: "This is the worst idea I've ever heard in my life! And I've heard some pretty bad ideas.", post: elon_post, user: trump)

