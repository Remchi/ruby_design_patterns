class ComputerProxy
  def initialize(real_object)
    @real_object = real_object
  end

  def add(command)
    @real_object.add(command)
  end

  def execute
    @real_object.execute
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