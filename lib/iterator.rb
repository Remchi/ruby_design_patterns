class Inventory
  attr_reader :items

  def initialize
    @items = []
  end

  def add(item)
    @items << item
  end
end

class Item
  attr_accessor :cost

  def initialize
    @cost = 0
  end
end