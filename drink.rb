class Drink

attr_reader :name, :price, :level, :label

  def initialize(name, price, level)
    @name = name
    @price = price
    @level = level
    @label = name.to_sym
  end


end
