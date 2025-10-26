# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
# Clear existing records (optional, useful for reseeding)
Kitten.destroy_all

puts "Creating kittens..."

names = ["Mochi", "Luna", "Simba", "Oreo", "Milo", "Nala", "Cleo", "Whiskers", "Pumpkin", "Shadow"]

names.each do |name|
  Kitten.create!(
    name: name,
    age: rand(1..12),          # Age between 1 and 12 months
    cuteness: rand(5..10),     # 5–10 scale
    softness: rand(5..10)      # 5–10 scale
  )
end

puts "Created #{Kitten.count} kittens!"
