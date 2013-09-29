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