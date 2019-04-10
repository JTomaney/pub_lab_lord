class Pub

attr_reader :name
attr_accessor :till, :drinks

  def initialize(name, till = 0, drinks = [])
    @name = name
    @till = till
    @drinks = drinks
  end

  def add_drinks(drink)
    @drinks.concat(drink)
  end

  def sell_a_drink(drink, age)
    if age >= 18
      @till += drink.price
    else
      return "barred"
    end
  end

end
