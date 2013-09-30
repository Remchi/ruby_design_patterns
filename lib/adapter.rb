class QuestAdapter
  attr_accessor :hero

  def initialize(old_quest, difficulty)
    @old_quest = old_quest
    @old_quest.difficulty = difficulty
    @hero = nil
  end

  def finish
    @hero.exp += @old_quest.done
  end
end

class OldQuest
  attr_accessor :experience, :difficulty

  def initialize
    @difficulty = 3
    @experience = 10
  end

  def done
    difficulty * experience
  end

  # complex behaviour
end

class Quest
  attr_accessor :difficulty, :hero

  def initialize(difficulty)
    @difficulty = difficulty
    @hero = nil
  end

  def finish
    @hero.exp += calculate_experience
  end

  def calculate_experience
    difficulty * 50 / @hero.level
  end

  # complex
end

class Hero
  attr_accessor :level, :exp, :quests
  def initialize
    @level = 1
    @exp = 0
    @quests = []
  end

  def take_quest(quest)
    @quests << (quest.hero = self)
  end

  def finish_quest(quest)
    quest.finish
    @quests.delete(quest)
  end
end