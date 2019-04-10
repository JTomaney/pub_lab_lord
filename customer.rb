class Customer

  attr_reader :name
  attr_accessor :wallet, :age

  def initialize(name, wallet, age)
    @name = name
    @wallet = wallet
    @age = age
  end

  def buy_drink(pub, drink)
    @wallet -= drink.price
    pub.sell_a_drink(drink)
  end

end
