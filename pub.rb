class Pub

attr_reader :name
attr_accessor :till, :drinks, :food

  def initialize(name, till = 0, drinks = {}, food = [])
    @name = name
    @till = till
    @drinks = drinks
    @food = food

  end

  def add_drinks(drink)
    @drinks.concat(drink)
  end

  def sell_a_drink(drink, age, drunk)
    if age >= 18 && drunk <= 50
      @till += drink.price
      @drinks[drink.label] -= 1
    else
      return "barred"
    end
  end

  def sell_food(food)
    @till += food.price
  end

  def stock_total
    total = 0
    @drinks.each_value{|stock| total += stock}
    return total
  end

end
