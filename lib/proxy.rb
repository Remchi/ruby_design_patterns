require 'forwardable'

class ComputerProxy
  extend Forwardable

  def_delegators :@real_object, :add, :execute

  def initialize(real_object)
    @real_object = real_object
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