# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'
require "open-uri"

puts "Renters registering their cars..."


50.times do

	user = User.create!(
		first_name: Faker::Movies::HarryPotter.character.split[0],
		last_name: Faker::Movies::HarryPotter.character.split[1],
		email: Faker::Internet.email,
	)

	fake_make = Faker::Vehicle.make
	fake_model = Faker::Vehicle.model(make_of_model: fake_make)
	file = URI.open(`http://loremflickr.com/280/280/#{fake_make} #{fake_model}`)

	car = Car.new(
		make: fake_make,
		model: fake_model,
		year: Faker::Vehicle.year,
		description: Faker::Vehicle.standard_specs,
		location: Faker::Address.city,
		price: rand(500..3000),
	)
	car.photo.attach(io: file, filename: 'car.png', content_type: 'image/png')
	car.user_id = user.id
	car.save!
end

puts "All cars registered"