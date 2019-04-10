require("minitest/autorun")
require("minitest/rg")
require_relative("../drink.rb")

class DrinkTest < MiniTest:: Test

def test_make_a_drink
  @drink = Drink.new("Beer", 2)
  assert_equal("Beer", @drink.name)
end



end
