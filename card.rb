class Card
  attr_accessor :name, :cost, :type

  def initialize(name, type, cost = 0)
    @name = name
    @cost = cost
    @type = type
  end

  def converted_cost
    cost.length
  end

end
