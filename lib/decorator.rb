require 'forwardable'

class ItemDecorator
  extend Forwardable

  def_delegator :@item, :use

  def initialize(item)
    @item = item
  end
end

class MagicItemDecorator < ItemDecorator
  def price
    @item.price * 3
  end

  def description
    @item.description + "Magic."
  end
end

class MasterpieceItemDecorator < ItemDecorator
  def price
    @item.price * 2
  end

  def description
    @item.description + "Masterpiece."
  end
end

class Item
  attr_reader :price, :description

  def initialize(is_magic = false, is_masterpiece = false)
    @price = 10
    @description = "Item."

    if is_magic
      @price *= 3
      @description += "Magic."
    end

    if is_masterpiece
      @price *= 2
      @description += "Masterpiece."
    end
  end

  def use
  end
end