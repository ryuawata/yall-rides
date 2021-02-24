# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'
require "open-uri"

Booking.destroy_all

User.destroy_all

puts "Renters registering their cars..."

50.times do
	user = User.create!(
		first_name: Faker::Movies::HarryPotter.character.split[0],
		last_name: Faker::Movies::HarryPotter.character.split[1],
		email: Faker::Internet.email,
		password: Faker::Internet.password(min_length: 8)
	)

	file = URI.open('https://thispersondoesnotexist.com/image')
	user.photo.attach(io: file, filename: 'user.png', content_type: 'image/png')

	fake_make = Faker::Vehicle.make.split.join
	fake_model = Faker::Vehicle.model(make_of_model: fake_make).split.join

	puts "Fetching photo for #{fake_make} #{fake_model}..."

	file = URI.open("http://loremflickr.com/600/400/#{fake_make}-#{fake_model}")

	car = Car.new(
		make: fake_make,
		model: fake_model,
		year: Faker::Vehicle.year,
		description: Faker::Vehicle.standard_specs,
		location: Faker::Address.city,
		price: rand(500..3000)
	)
	car.photo.attach(io: file, filename: 'car.jpg', content_type: 'image/jpg')
	car.user = user
	car.save!
	# file.rewind
end

puts "All cars registered"
