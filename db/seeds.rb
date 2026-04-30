# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

EventCategory.destroy_all
Registration.destroy_all
Review.destroy_all
Event.destroy_all
Category.destroy_all
User.destroy_all

# USERS
user1 = User.create!(name: "Simon", email: "simon@test.com", password: "123456")
user2 = User.create!(name: "Ana", email: "ana@test.com", password: "123456")

# CATEGORIES
tech = Category.create!(name: "Technology")
music = Category.create!(name: "Music")

# EVENTS
event1 = Event.create!(
  name: "Ruby on Rails Meetup",
  description: "Learn Rails with other developers",
  date: DateTime.now + 5,
  location: "Santiago",
  capacity: 50,
  user: user1
)

event2 = Event.create!(
  name: "Music Festival",
  description: "Live music event",
  date: DateTime.now + 10,
  location: "Valparaíso",
  capacity: 200,
  user: user2
)

# EVENT CATEGORIES
EventCategory.create!(event: event1, category: tech)
EventCategory.create!(event: event2, category: music)

# REGISTRATIONS (ENUM CORRECTO)
Registration.create!(user: user2, event: event1, status: :confirmed)
Registration.create!(user: user1, event: event2, status: :pending)

# REVIEWS
Review.create!(user: user2, event: event1, rating: 5, comment: "Great event!")
Review.create!(user: user1, event: event2, rating: 4, comment: "Very fun experience")