class Hero
  attr_reader :damage, :abilities

  def initialize
    @damage = 10
    @abilities = []
  end

  def attack
    "Attacked dealing #{damage} damage"
  end
end

class Warrior < Hero
  def initialize
    @damage = 15
    @abilities = [:strike]
  end
end

class Mage < Hero
  def initialize
    @damage = 7
    @abilities = [:magic_arrow]
  end
end