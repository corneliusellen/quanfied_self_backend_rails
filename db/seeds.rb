# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
FoodMeal.all.destroy_all
Food.all.destroy_all
Meal.all.destroy_all

ActiveRecord::Base.connection.reset_pk_sequence!(:meals)

meals = ["Breakfast", "Snacks", "Lunch", "Dinner"]
meals.each do |meal|
  Meal.create!(name: meal)
  puts "Created #{meal}"
end
