class Encounter
  attr_reader :reward

  def initialize
    @reward = 100
  end
end

class Puzzle
  attr_reader :reward

  def initialize
    @reward = 200
  end
end

class Diplomacy
  attr_reader :reward

  def initialize
    @reward = 500
  end
end
