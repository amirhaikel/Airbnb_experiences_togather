# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
require "open-uri"

file = URI.open("some_picture_link")
experience = Experience.new(name: "XXX", description: "XXXXXX", price: XXXXXX)
experience.photos.attach(io: file, filename: "xxx.png", content_type: "image/png")
experience.save
