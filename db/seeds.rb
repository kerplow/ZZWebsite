# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

20.times do
  user = User.new
  user.first_name = Faker::Name.first_name
  user.last_name = Faker::Name.last_name
  user.nickname = Faker::DragonBall.character
  user.bio = Faker::MostInterestingManInTheWorld.quote
  user.phone_number = Faker::PhoneNumber.phone_number
  user.email = Faker::Internet.email
  user.password = 'password'
  user.save!
end

20.times do
  event = PlannerEvent.new
  event.name = Faker::GameOfThrones.character
  event.description = Faker::GameOfThrones.quote
  event.start_time = rand(100).hours.from_now
  event.end_time = event.start_time + rand(1..10).hours
  event.save!
end

20.times do
  note = Note.new
  note.name = Faker::WorldOfWarcraft.hero
  note.contents = Faker::WorldOfWarcraft.quote
  note.save!
end

p 'seed done'