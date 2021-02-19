# frozen_string_literal: true
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'
require 'open-uri'
require 'json'

puts "Cleaning database..."
Ingredient.destroy_all

puts "Reading ingredient names..."
url = "https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list"
ingredients = JSON.parse(open(url).read)

ingredients['drinks'].each do |i|
  ingredient  = Ingredient.create!(
    name: i['strIngredient1']
  )
  puts "Ingredient #{ingredient.name} succesfully created"
end

# 5.times do
#   ingredient = Ingredient.create!(
#     name: Faker::Name.name
#   )
#   puts "#{ingredient.name} successfully created"
# end

puts "All the ingredients successfully created!"
