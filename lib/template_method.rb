class Hero
  attr_reader :damage

  def initialize(occupation = nil)
    if occupation == :warrior
      @damage = 15
    else
      @damage = 10
    end
  end

  def attack
    "Attacked dealing #{damage} damage"
  end
end