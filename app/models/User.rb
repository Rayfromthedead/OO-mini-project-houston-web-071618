
class User


  attr_accessor :name
  attr_reader :rating

  @@all =[]

  def initialize(name)
    @name = name
    @@all << self
  end

  def self.all
    @@all
  end

  def user_cards
    RecipeCard.all.select do |recipecard|
      recipecard.user == self
    end
  end

  def recipes
    user_cards.map do |recipecard|
      recipecard.recipe

    end
  end

  def add_recipe_card(recipe, date, rating)
      recipe = RecipeCard.new(date, rating, self, recipe)
      #return recipe card with recipe, user, rating, date
    # - `User#add_recipe_card`
    # should accept a recipe instance as an argument, as well as a date and rating, and create a new recipe card for this user and the given recipe
  end

  def declare_allergen(ingredient)
    ingredient = Allergen.new(self, ingredient)
    # - `User#declare_allergen`
    # should accept an ingredient instance as an argument, and create a new allergen instance for this user and the given ingredient
  end

  def user_allergens
    Allergen.all.select do |allergen|
      allergen.user == self
    end
  end

  def allergens
    self.user_allergens.map do |allergen|
      allergen.ingredient
    end
  end




  def recipe_by_rating
    self.user_cards.sort_by do |user_reacipe_card|
    user_reacipe_card.rating
    end
  end

  def top_three_recipes
    self.recipe_by_rating.last(3)

  end
  def recipe_by_date
    self.user_cards.sort_by do |user_reacipe_card|
    user_reacipe_card.date.split
    end
  end

  def most_recent_recipe
    self.recipe_by_date.last(1)

# - `User#most_recent_recipe`
# should return the recipe most recently added to the user's cookbook.
  end

  def safe_recipes
   RecipeCard.all.select do |recipe_card|
     recipe_card.recipe.ingredients != self.allergens
   end
  end
end


# ### `**Bonus**`
# - `User#safe_recipes`
# should return all recipes that do not contain ingredients the user is allergic to
