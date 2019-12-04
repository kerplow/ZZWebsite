# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Option.delete_all
List.delete_all
User.delete_all

p 'creating rooms'
for i in 1..32 do
  Room.create(number: i)
end

chuck = User.first_or_create(email: 'charlesdegh@gmail.com', password: ENV['ADMIN_PASSWORD'], first_name: 'Charles' ,last_name: 'de Gheldere', nickname: 'Evil Overlord', admin: true, house_status: 3)
chuck.save!

test_user = User.first_or_create(email: 'test@gmail.com', password: 'test', first_name: 'test' ,last_name: 'test', nickname: 'Dummy', admin: false, house_status: 3)
test_user.save!

# 20.times do |n|
#   user = User.new
#   user.first_name = Faker::Name.first_name
#   user.last_name = Faker::Name.unique.last_name
#   user.nickname = Faker::JapaneseMedia::DragonBall.unique.character
#   user.bio = Faker::Quote.unique.most_interesting_man_in_the_world
#   user.room = nil
#   user.phone_number = Faker::PhoneNumber.phone_number
#   user.email = "#{user.first_name}_#{user.last_name}@zzw.nl"
#   user.password = 'password'
#   user.save!
# end

# 20.times do
#   event = PlannerEvent.new
#   event.name = Faker::TvShows::GameOfThrones.unique.character
#   event.description = Faker::TvShows::GameOfThrones.unique.quote
#   event.start_time = rand(100).hours.from_now
#   event.end_time = event.start_time + rand(1..10).hours
#   event.save!
# end

# 20.times do |i|
#   note = Note.new
#   note.name = Faker::Games::WorldOfWarcraft.unique.hero
#   note.contents = Faker::Games::WorldOfWarcraft.unique.quote
#   if i > 10
#     note.is_public = false
#   end
#   note.save!
# end

# default lists:
list = List.first_or_create(title: 'Subtitle', user: chuck)
default = Option.new(name: "It's a pirates life for me")
default.list = list
default.save!
default.vote_by chuck

# poll = Poll.new(name: list.title, list: list)
# poll.choices_from_list
# poll.save!

list = List.first_or_create(title: 'Suggestions', user: chuck)
list.save!

p 'seed done'
