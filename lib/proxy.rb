require 'forwardable'

class Hero
  attr_accessor :keywords

  def initialize
    @keywords = []
  end
end

class ComputerProxy
  extend Forwardable

  def_delegators :@real_object, :add

  def initialize(real_object, hero)
    @real_object = real_object
    @hero = hero
  end

  def execute
    check_access
    @real_object.execute
  end

  def check_access
    unless @hero.keywords.include?(:computer)
      raise 'You have no access'
    end
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