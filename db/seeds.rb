# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
category = %w[chinese italian japanese french belgian].freeze

10.times do
  restaurant = Restaurant.new(
    name: Faker::Restaurant.name,
    address: Faker::Address.street_address,
    category: category.sample,
    phone_number: Faker::PhoneNumber.phone_number
  )
  restaurant.save
  puts "Created #{restaurant.name}"

  3.times do
    review = Review.new(
      content: Faker::Quote.most_interesting_man_in_the_world,
      rating: rand(1..5)
    )
    review.restaurant = restaurant
    review.save
    puts "Review created for #{restaurant.name}"
  end
end
