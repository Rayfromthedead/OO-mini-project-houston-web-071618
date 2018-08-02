

class Ingredient

  attr_reader  :item

  @@all =[]


  def initialize(item)
    @item = item
    @@all << self
  end

  def self.all
    @@all
  end

  def self.common_allergens
     Allergen.all.map do |allergen_instance|
        allergen_instance.ingredient
      end

  end


    # - `Ingredient.most_common_allergen`
    # should return the ingredient instance that the highest number of users are allergic to

  def self.most_common_allergen
      ingredient_most_allergic = Hash.new(0)
      self.common_allergens.each do |ingredient|
        ingredient_most_allergic[ingredient] += 1
      end
      ingredient_most_allergic.max_by { |k, v| v}
  end

end
