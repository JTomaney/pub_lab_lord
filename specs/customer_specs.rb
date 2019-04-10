require("minitest/autorun")
require("minitest/rg")
require_relative("../drink.rb")
require_relative("../pub.rb")
require_relative("../customer.rb")

class CustomerTest < MiniTest:: Test

  def setup
    @drink = Drink.new("Beer", 2)
    @pub = Pub.new("The Winchester", 0, [@drink])
    @customer = Customer.new("Alf", 10, 19)
  end

  def test_is_a_customer
    assert_equal(10, @customer.wallet)
  end

  def test_a_customer_buys_a_drink
    @customer.buy_drink(@pub, @drink)
    assert_equal(8, @customer.wallet)
    assert_equal(2, @pub.till)
  end


end
