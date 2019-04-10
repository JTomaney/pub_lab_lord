require("minitest/autorun")
require("minitest/rg")
require_relative("../drink.rb")
require_relative("../pub.rb")

class PubTest < MiniTest:: Test

  def test_make_a_pub
    @pub = Pub.new("The Winchester")
    assert_equal("The Winchester", @pub.name)
  end

  def test_add_drinks_to_stock
    @pub = Pub.new("The Winchester")
    @pub.add_drinks(["Beer"])
    assert_equal(["Beer"], @pub.drinks)
  end

end
