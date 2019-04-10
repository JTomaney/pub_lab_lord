class Customer

  attr_reader :name
  attr_accessor :wallet

  def initialize(name, wallet)
    @name = name
    @wallet = wallet
  end

  def buy_drink(pub, drink)
    @wallet -= drink.price
    pub.sell_a_drink(drink)
  end

end
