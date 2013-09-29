class Party
  attr_reader :members

  def initialize(factory)
    @members = []
    @factory = factory
  end

  def add_warriors(number)
    number.times { members << @factory.create_warrior }
  end
  def add_mages(number)
    number.times { members << @factory.create_mage }
  end
end

class HeroFactory
  def create_warrior
    Warrior.new
  end

  def create_mage
    Mage.new
  end
end


class PartyFactory < Party
  def create(occupation)
    if [:warrior, :mage].include?(occupation)
      self.class.const_get(occupation.to_s.capitalize).new
    else
      raise "Unknown"
    end
  end
end

class Hero
  attr_reader :damage, :abilities

  def initialize
    initialize_stats

    @damage = damage_rating
    @abilities = occupation_abilities
  end

  def greet
    greeting = ["Hello"]
    greeting << unique_greeting_line
    greeting
  end

  def unique_greeting_line
    raise "You must define unique_greeting_line"
  end

  def damage_rating
    10
  end

  def occupation_abilities
    []
  end

  def attack
    "Attacked dealing #{damage} damage"
  end

  def initialize_stats
  end
end

class Warrior < Hero
  def damage_rating
    15
  end

  def occupation_abilities
    [:strike]
  end

  def unique_greeting_line
    "Warrior is ready to fight"
  end
end

class Mage < Hero
  def damage_rating
    7
  end

  def occupation_abilities
    [:magic_arrow]
  end
end