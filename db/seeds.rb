# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# require 'open-uri'
# url = 'https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list'
# ingredient_data = open(url).read
# ingredient = JSON.parse(ingredient_data)

# ingredient["drinks"].each do |i|
#   new_ingredient = Ingredient.create(name: i["strIngredient1"])
#   # puts " #{i.name}"
# end

Car.create(brand: "De Tomaso Pantera ")
Car.create(brand: "Ferrari")
Car.create(brand: "Chevrolet Camaro")
Car.create(brand: "Land Rover")
Car.create(brand: "Plymouth")
Car.create(brand: "Toyota")
Car.create(brand: "Porsche")
Car.create(brand: "Volkswagen")
Car.create(brand: "Plymouth")
Car.create(brand: "Toyota")
Car.create(brand: "Porsche")

