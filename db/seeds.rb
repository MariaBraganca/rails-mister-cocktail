# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'json'
require 'open-uri'

chars = [*('0'..'9'), *('a'..'z')]

chars.each do |character|
  url="https://www.thecocktaildb.com/api/json/v1/1/search.php?f=#{character}"
  cocktails_serialized = open(url).read
  cocktails = JSON.parse(cocktails_serialized)

  next if cocktails["drinks"].nil?

  cocktails["drinks"].each do |drink|
    cocktail = Cocktail.create!(
      name: drink["strDrink"], 
      thumb_url: drink["strDrinkThumb"],
      instruction: drink["strInstructions"],
      category: drink["strCategory"].capitalize,
      alcoholic: drink["strAlcoholic"].capitalize,
      glass: drink["strGlass"].capitalize
      )
    (1..15).each do |i|
      next if drink["strIngredient#{i}"].nil? || drink["strMeasure#{i}"].nil?
      next if drink["strIngredient#{i}"].blank? || drink["strMeasure#{i}"].blank?
      ingredient = Ingredient.where(name: drink["strIngredient#{i}"]).first_or_create!
      dose = Dose.create!(
        cocktail_id: cocktail.id,
        ingredient_id: ingredient.id,
        description: drink["strMeasure#{i}"]
      )
    end
  end
end
