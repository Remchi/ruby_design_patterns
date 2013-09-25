class Inventory
  include Enumerable

  attr_reader :items

  def initialize
    @items = []
  end

  def add(item)
    @items << item
  end

  def each(&block)
    @items.each(&block)
  end
end

class Item
  attr_accessor :cost

  def initialize
    @cost = 0
  end

  def <=>(other)
    cost <=> other.cost
  end
end

class InventoryIterator
  def initialize(inventory)
    @items = inventory.items
    @index = 0
  end

  def has_next?
    @index < @items.size
  end

  def next
    value = @items[@index]
    @index += 1
    value
  end
end