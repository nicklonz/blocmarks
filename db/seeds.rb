require 'faker'

# Create Users
25.times do
  user = User.new(
    name:     Faker::Name.name,
    email:    Faker::Internet.email,
    password: Faker::Lorem.characters(10)
  )
  user.skip_confirmation!
  user.save
end
users = User.all

# Create Topics
15.times do
  Topic.create(
    name:         Faker::Lorem.word
  )
end
topics = Topic.all

# Create Bookmarks
100.times do
  Bookmark.create(
    user:   users.sample,
    topic:  topics.sample,
    url:    Faker::Internet.url
  )
end
bookmarks = Bookmark.all

User.first.update_attributes(
  email: 'mrtest@mailinator.com',
  password: 'helloworld',
)

puts "Seed finished"
puts "#{User.count} users created"
puts "#{Bookmark.count} bookmarks created"
