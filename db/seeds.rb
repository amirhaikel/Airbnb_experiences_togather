# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
require "open-uri"
require "faker"

puts "Cleaning up database..."
Experience.destroy_all
User.destroy_all
Booking.destroy_all
Review.destroy_all
puts "Database cleaned"
puts "Creating test user..."
User.destroy_all
test_user = User.new(
  first_name: "John",
  last_name: "Doe",
  phone_no: 88888888,
  email: "johndoe@gmail.com",
  password: "password"
)
test_user.save!
puts "Test user created!"

image_url = Faker::LoremFlickr.image(size: "300x400", search_terms: ['activity', 'outdoor'])

10.times do |i|
  puts "Importing experiences from #{i+1}"
  file = URI.open(image_url)
  experience = Experience.new(
    name: Faker::Hobby.activity,
    description: Faker::Lorem.paragraph(sentence_count: 3),
    price: Faker::Commerce.price(range: 10..100),
    capacity: rand(31)
  )
  experience.user = test_user
  experience.photos.attach(io: file, filename: "#{experience.name}.png", content_type: "image/png")
  experience.save!
end

image11_url = "https://images.unsplash.com/flagged/photo-1561668038-2742fcef75d7?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80"

experience_11 = Experience.new(
  name: "Bakes",
  description: "Offering a wide and tantalising spread of courses, SSA Culinary Institute's (SSACI) main aim as a culinary institute is to provide training in baking and empower learners to be skilled workers and micro-entrepreneurs. SSACI is currently the largest halal baking school in Singapore.",
  price: 150,
  capacity: 25,
  user: test_user
)
file = URI.open(image11_url)
experience_11.photos.attach(io: file, filename: "#{experience_11.name}.png", content_type: "image/png")
experience_11.save!

image12_url = "https://images.unsplash.com/photo-1596673325912-423fb1425a5e?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80"

experience_12 = Experience.new(
  name: "Kayaks",
  description: "Kayaking is a fun activity that involves moving through water in a small water vessel with the aid of a double-bladed paddle. It allows the boat driver to maneuver through waterways by sitting face-forward and propelling ahead with alternating side-to-side paddle strokes.",
  price: 80,
  capacity: 25,
  user: test_user
)
file = URI.open(image12_url)
experience_12.photos.attach(io: file, filename: "#{experience_12.name}.png", content_type: "image/png")
experience_12.save!

puts "Experiences created!"
puts "Finished!"
