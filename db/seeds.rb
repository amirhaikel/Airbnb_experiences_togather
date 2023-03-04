# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
require "open-uri"
require "faker"

image_url = Faker::LoremFlickr.image(size: "300x400", search_terms: ['activity', 'outdoor'])

puts "Cleaning up database..."
Experience.destroy_all
User.destroy_all
puts "Database cleaned"
puts "Creating test user..."
User.destroy_all
test_user = User.new(
  first_name: "Laika",
  last_name: "Chee",
  phone_no: 88888888,
  email: "cheelaika@gmail.com",
  password: "password"
)
test_user.save!
puts "Test user created!"

10.times do |i|
  puts "Importing experiences from #{i+1}"
  file = URI.open(image_url)
  experience = Experience.new(
    name: Faker::Hobby.activity,
    description: Faker::Lorem.paragraph(sentence_count: 3),
    price: Faker::Commerce.price(range: 10..100),
  )
  experience.user = test_user
  experience.photos.attach(io: file, filename: "#{experience.name}.png", content_type: "image/png")
  experience.save!
end
puts "Experiences created!"
puts "Finished!"
