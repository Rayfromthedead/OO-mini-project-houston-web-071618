require_relative '../config/environment.rb'
# require 'pry'

#users
ray = User.new("Ray")
becci = User.new("Becci")
humzi = User.new("Humzi")



#recipes
egg_dish = Recipe.new("Egg Dish", ["eggs", "zuccini", "sausage", "mushrooms"])
scrambled_eggs = Recipe.new("scrambled_eggs", ["milk", "eggs"] )
best_pbj = Recipe.new("BESTEST 🤩 P.B.J.", ["toasted whole grain bread", "strawberry preserves", "PAN crunchy PB"] )

tomato_sauce = Recipe.new("tomato_sauce", ["tomatoes", "basil"])
zuccini = Ingredient.new("zuccini")

tomato = Ingredient.new("tomato")
Allergen.new(ray, zuccini)
Allergen.new(ray, tomato)
Allergen.new(humzi, tomato)
#user creates card
one = ray.add_recipe_card(best_pbj, "2018.07.01", 3)
two = ray.add_recipe_card(scrambled_eggs, "2018.08.01", 3)
three = ray.add_recipe_card(scrambled_eggs, "2018.07.16", 5)



# becci.declare_allergen("milk")
# ray.declare_allergen("egg-plant")
binding.pry
