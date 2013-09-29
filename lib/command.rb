class Turn
  def initialize
    @moves = []
  end

  def make_move(move)
    move.execute
    @moves << move
  end

  def undo_move
    @moves.pop.unexecute
  end
end

class Hero
  attr_accessor :wood, :health, :money

  def initialize
    @wood = 0
    @health = 0
    @money = 0
  end
end


class ChopWoodCommand
  def initialize(hero)
    @hero = hero
  end

  def execute
    @hero.wood += 10
  end

  def unexecute
    @hero.wood -= 10
  end
end

class HealCharacterCommand
  def initialize(hero)
    @hero = hero
  end

  def execute
    @hero.health += 5
  end

  def unexecute
    @hero.health -= 5
  end
end


class GetMoneyCommand
  def initialize(hero)
    @hero = hero
  end

  def execute
    @hero.money += 50
  end

  def unexecute
    @hero.money -= 50
  end
end














class Reactor
  def initialize
    @functional = false
    @right_command = %Q{
Amplified Plutonium-Gamma Shield
Calibrated Uranium-Rod Driver
Tested Jupiter Wave Complier
Installed Hydroelectric Magnetosphere Regulator
}
  end

  def fix(result)
    @functional = result == @right_command
  end

  def functional?
    @functional
  end
end

class Computer
  attr_reader :queue

  def initialize
    @queue = []
  end

  def add(command)
    @queue << command
  end

  def execute
    queue.inject("\n") { |result, command| result + command.execute + "\n"}
  end
end


class AmplifyShieldCommand
  def execute
    "Amplified Plutonium-Gamma Shield"
  end
end

class CalibrateDriverCommand
  def execute
    "Calibrated Uranium-Rod Driver"
  end
end

class TestComplierCommand
  def execute
    "Tested Jupiter Wave Complier"
  end
end

class InstallRegulatorCommand
  def execute
    "Installed Hydroelectric Magnetosphere Regulator"
  end
end