require("minitest/autorun")
require("minitest/rg")
require_relative("../drink.rb")
require_relative("../pub.rb")
require_relative("../customer.rb")

class PubTest < MiniTest:: Test

  def setup
    @drink2 = Drink.new("Wine", 3, 12)
    @drink = Drink.new("Beer", 2, 5)
    @pub = Pub.new("The Winchester", 0 , [@drink])
  end

  def test_make_a_pub
    assert_equal("The Winchester", @pub.name)
  end

  def test_add_drinks_to_stock
    @pub.add_drinks([@drink2])
    assert_equal([@drink, @drink2], @pub.drinks)
  end

  def test_sells_a_drink__age_over_18
    @pub.sell_a_drink(@drink, 19)
    assert_equal(2, @pub.till)
  end

  def test_sells_a_drink__age_under_18
    assert_equal("barred", @pub.sell_a_drink(@drink, 17))

  end

end
