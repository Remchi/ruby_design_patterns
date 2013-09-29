require 'spec_helper'
require_relative '../lib/proxy'

describe "Proxy Pattern" do

  it "delegates all functionality to the real object" do
    hero = Hero.new
    computer = double("computer", queue: [], add: [], execute: true)
    proxy = ComputerProxy.new(computer, hero)

    computer.should_receive(:add)
    proxy.add(double("command"))

    hero.keywords << :computer
    computer.should_receive(:execute)
    proxy.execute
  end

end