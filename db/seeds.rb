# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'
require 'open-uri'

Transaction.destroy_all
Artwork.destroy_all
User.destroy_all

images = ['https://images.unsplash.com/photo-1579762593131-b8945254345c?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1722&q=80','https://images.unsplash.com/photo-1561059488-916d69792237?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=800&q=60', 'https://images.unsplash.com/photo-1560579499-ab30d29dfd9a?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=800&q=60', 'https://images.unsplash.com/photo-1541662411770-fd2e3fc64781?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=800&q=60', 'https://images.unsplash.com/photo-1526304760382-3591d3840148?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=800&q=60', 'https://images.unsplash.com/photo-1490535004195-099bc723fa1f?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=800&q=60', 'https://images.unsplash.com/photo-1491403938640-b57372002c94?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=800&q=60', 'https://images.unsplash.com/photo-1538642448565-472399e1e630?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=800&q=60', 'https://images.unsplash.com/photo-1566571756801-6459d6feb690?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=800&q=60', 'https://images.unsplash.com/photo-1523554888454-84137e72c3ce?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=800&q=60' ]

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
    description: "#{Faker::Address.street_address}, #{Faker::Address.city} Lorem blablabakbababanaababbabababa",
    price_per_hour:  rand(0..5),
    user: User.all.sample

  )
  file = URI.open(images.sample)
  artwork.photo.attach(io: file, filename: 'artwork.png', content_type: 'image/png')
  artwork.save!
end
puts 'Finished!'
