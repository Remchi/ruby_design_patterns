class Inventory
end

class Item
  attr_reader :cost

  def initialize
    @cost = 0
  end
end