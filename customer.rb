class Customer

  attr_reader :name, :drunk
  attr_accessor :wallet, :age

  def initialize(name, wallet, age)
    @name = name
    @wallet = wallet
    @age = age
    @drunk = 0
  end

  def buy_drink(pub, drink)
    @wallet -= drink.price
    @drunk += drink.level
    pub.sell_a_drink(drink, @age)
  end

end
