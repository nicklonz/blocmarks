require 'faker'

# Create Users
10.times do
  user = User.new(
    email: Faker::Internet.email,
    password: Faker::Lorem.characters(10)
    )
  user.skip_confirmation!
  user.save
end

users = User.all

 # Create Topics
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

# Create an admin user
admin = User.new(
  email:    'admin@example.com',
  password: 'helloworld',
)
admin.skip_confirmation!
admin.save

# Create a member
member = User.new(
  email:    'member@example.com',
  password: 'helloworld',
)
member.skip_confirmation!
member.save

puts "Seeds finished:"
puts "#{User.count} Users Created"
puts "#{Topic.count} Topics Created"
puts "#{Bookmark.count} Blocmarks Created"
