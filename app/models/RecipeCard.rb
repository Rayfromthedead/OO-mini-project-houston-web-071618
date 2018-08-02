
# A RecipeCard is the join between a user instance and a recipe instance.  This is a has-many-through relationship.
class RecipeCard


  attr_accessor :date, :rating, :recipe, :user

  @@all = []

  def initialize(date, rating = 3, user, recipe)
    @recipe = recipe
    @user = user
    @rating = rating
    @date = date
    @@all << self

  end

  def self.all
    @@all
  end


end
