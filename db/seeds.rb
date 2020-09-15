# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'

puts 'Creating 10 fake users...'
10.times do |i|
  user = User.new(
    email:   "user_#{i}@gmail.com",
    password: "password"
  )
  user.save!
end
puts 'Finished!'


puts 'Creating 10 fake artworks...'
10.times do
  artwork = Artwork.new(
    title:    Faker::Company.name,
    description: "#{Faker::Address.street_address}, #{Faker::Address.city}",
    price_per_hour:  rand(0..5),
    user: User.all.sample

  )
  artwork.save!
end
puts 'Finished!'
