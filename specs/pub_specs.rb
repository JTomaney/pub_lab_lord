require("minitest/autorun")
require("minitest/rg")
require_relative("../drink.rb")
require_relative("../pub.rb")
require_relative("../food.rb")


class PubTest < MiniTest:: Test

  def setup
    @drink2 = Drink.new("Wine", 3, 12)
    @drink = Drink.new("Beer", 2, 5)
    @pub = Pub.new("The Winchester", 0 , [@drink])
    @food = Food.new("Pie", 2, 5)
  end

  def test_make_a_pub
    assert_equal("The Winchester", @pub.name)
  end

  def test_add_drinks_to_stock
    @pub.add_drinks([@drink2])
    assert_equal([@drink, @drink2], @pub.drinks)
  end

  def test_sells_a_drink__age_over_18
    @pub.sell_a_drink(@drink, 19, 0)
    assert_equal(2, @pub.till)
  end

  def test_sells_a_drink__age_under_18
    assert_equal("barred", @pub.sell_a_drink(@drink, 17, 0))
  end

  def test_sells_a_drink_customer_drunk
    assert_equal("barred", @pub.sell_a_drink(@drink, 20, 65))
  end

  def test_sells_a_pie
    @pub.sell_food(@food)
    assert_equal(2, @pub.till)
  end

end
