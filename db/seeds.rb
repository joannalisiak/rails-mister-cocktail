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

cocktail_1 = Cocktail.new(name: "Lou's Mojito")
cocktail_1_picture = URI.open('https://images.unsplash.com/photo-1566733971017-f6a46e832e95?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=934&q=80')
cocktail_1.photo.attach(io: cocktail_1_picture, filename: 'mojito.png', content_type: 'image/png')
dose1_1 = Dose.create!(description: "Add four or five mint leaves for good measure", cocktail: cocktail_1, ingredient: Ingredient.first)
cocktail_1.save!

puts "All the ingredients successfully created!"
