# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
require 'faker'

Book.destroy_all
Author.destroy_all

10.times do
  author = Author.create!(
    name: Faker::Book.author
  )

  rand(2..5).times do
    Book.create!(
      title: Faker::Book.title,
      description: Faker::Lorem.paragraph(sentence_count: 7),
      cover: "https://via.placeholder.com/150",
      year: rand(1900..2023),
      rating: rand(3.0..5.0).round(1),
      isbn: Faker::Number.unique.number(digits: 13).to_s,
      read: [ true, false ].sample,
      author: author
    )
  end
end

puts "Seeded #{Author.count} authors and #{Book.count} books!"
