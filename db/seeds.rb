require 'faker'

5.times do
  user = User.new(
    name: Faker::Name.name,
    email: Faker::Internet.email,
    password: Faker::Lorem.characters(10)
    )
  user.skip_confirmation!
  user.save
end

users = User.all

10.times do
  topic = Topic.create(
    name:  Faker::Lorem.sentence
  )
  5.times do
    Bookmark.create(
      user: users.sample, 
      topic: topic,
      url: Faker::Internet.url
    )
  end
end

# Create Comments

# Create an admin user
admin = User.new(
  name:     'Admin User',
  email:    'admin@example.com',
  password: 'helloworld',
)
admin.skip_confirmation!
admin.save

# Create a member
member = User.new(
  name:     'Member User',
  email:    'member@example.com',
  password: 'helloworld',
)
member.skip_confirmation!
member.save

puts "Seeds finished:"
puts "#{Topic.count} Blocmarks Topics Created"
puts "#{Bookmark.count} Blocmarks Bookmarks Created"

