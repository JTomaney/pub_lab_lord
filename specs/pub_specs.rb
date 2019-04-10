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
    @pub2 = Pub.new("The Vic", 0, {
      @drink.label => 5,
      @drink2.label => 10
      })
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

  def test_pub_has_stock
    assert_equal({
    Beer: 5,
    Wine: 10
  }, @pub2.drinks)
  end

  def test_sells_a_drink__age_over_18
    @pub2.sell_a_drink(@drink, 19, 0)
    assert_equal(2, @pub2.till)
    assert_equal(4, @pub2.drinks[@drink.label])
  end

  def test_stock_total
    assert_equal(15, @pub2.stock_total )
  end

end
