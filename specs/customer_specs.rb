require("minitest/autorun")
require("minitest/rg")
require_relative("../drink.rb")
require_relative("../pub.rb")
require_relative("../customer.rb")
require_relative("../food.rb")

class CustomerTest < MiniTest:: Test

  def setup
    @drink = Drink.new("Beer", 2, 5)
    @drink2 = Drink.new("Wine", 5, 12)
    @pub = Pub.new("The Winchester", 0, [@drink])
    @customer = Customer.new("Alf", 10, 19)
    @food = Food.new("pie", 2, 5)
  end

  def test_is_a_customer
    assert_equal(10, @customer.wallet)
  end

  def test_a_customer_buys_a_drink
    @customer.buy_drink(@pub, @drink)
    assert_equal(8, @customer.wallet)
    assert_equal(2, @pub.till)
    assert_equal(5, @customer.drunk)
  end

  def test_customer_buys_food
    @customer.buy_food(@pub, @food)
    assert_equal(8, @customer.wallet)
  end

  def test_food_reduces_drunkeness
    @customer.buy_drink(@pub, @drink2)
    @customer.buy_food(@pub, @food)
    assert_equal(7, @customer.drunk)
  end


end
