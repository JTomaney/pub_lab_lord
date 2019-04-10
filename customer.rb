class Customer

  attr_reader :name
  attr_accessor :wallet

  def initialize(name, wallet)
    @name = name
    @wallet = wallet
  end

  def buy_drink(pub, drink)
    @wallet -= drinks.price
  end

end
