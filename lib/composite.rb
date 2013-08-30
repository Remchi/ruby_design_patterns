class MegaQuest

  def initialize
    @tasks = []
  end

  def add(task)
    @tasks << task
  end

  def reward
    @tasks.inject(0) { |sum, task| sum += task.reward }
  end

end

class Quest

  def initialize
    @tasks = []
  end

  def add(task)
    @tasks << task
  end

  def reward
    @tasks.inject(0) { |sum, task| sum += task.reward }
  end

end


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
