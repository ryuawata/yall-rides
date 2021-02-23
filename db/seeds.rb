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
		password: Faker::Internet.password(min_length: 8)
	)

	fake_make = Faker::Vehicle.make
	fake_model = Faker::Vehicle.model(make_of_model: fake_make)
	# file = URI.open("https://loremflickr.com/cache/resized/7257_7521636538_b4e8574bee_280_280_nofilter.jpg")

	car = Car.new(
		make: fake_make,
		model: fake_model,
		year: Faker::Vehicle.year,
		description: Faker::Vehicle.standard_specs,
		location: Faker::Address.city,
		price: rand(500..3000),
	)
	# car.photo.attach(io: file, filename: 'car.jpg', content_type: 'image/jpg')
	car.user_id = user.id
	car.save!
	# file.rewind
end

puts "All cars registered"
