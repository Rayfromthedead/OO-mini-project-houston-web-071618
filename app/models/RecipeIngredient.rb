
class RecipeIngredient
  attr_accessor :ingredient, :recipe
# RecipeIngredient is the join between an ingredient and a recipe.  This is a has-many-through relationship
# Build the following methods on the RecipeIngredient class

  @@all = []

  def initialize(ingredient, recipe)
    @ingredient = ingredient
    @recipe = recipe
    @@all << self
  end

  def self.all
    @@all
  end

end 
