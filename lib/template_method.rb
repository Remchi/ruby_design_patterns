class Hero
  attr_reader :damage

  def initialize
    @damage = 10
  end

  def attack
    "Attacked dealing #{damage} damage"
  end
end