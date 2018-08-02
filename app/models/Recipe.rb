class Recipe

  attr_accessor :recipe, :title, :ingredients, :allergen, :name, :users

  @@all = []

  def initialize(title, ingredients)
    @title = title
    @ingredients = ingredients
    @@all << self
  end

  def self.all
    @@all
  end

  def recipe_cards
    RecipeCard.all.select do |card_instance|
      card_instance.recipe == self
    end
  end

  def users
    self.recipe_cards.map do |card_for_current|
      card_for_current.user
    end
  end

  def allergen_ingredients
    ingredients = RecipeCard.all.map do |card|
      card.user
    end
    ingredients.each do |card_user|
      card_user.allergens
    end
  end

  def allergens
    self.allergen_ingredients.select do |this_recipe_ingredients|
      this_recipe_ingredients == self.ingredients
    end
    # should return all of the ingredients in this recipe that are allergens
  end



  def add_ingredients(ingredient_instances)
     ingredient_instances.each do |ingredient_instance|
    RecipeIngredient.new(ingredient_instance, self)
    end
  end


  def self.find_popular
    used_recipes = Hash.new(0)
    RecipeCard.all.each do |card_instance|
      used_recipes[card_instance.recipe] += 1
    end
    used_recipes.max_by { |k, v| v }
  end

  def self.most_popular
    find_popular.shift
  end



end
