# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

100.times do
  Book.create!(name: Faker::Book.title,
               price: rand(200..500),
               sku: rand(36**8).to_s(36),
               author: Faker::Book.author,
               publisher: Faker::Book.publisher)
end
