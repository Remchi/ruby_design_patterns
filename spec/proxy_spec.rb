require 'spec_helper'
require_relative '../lib/proxy'

describe "Proxy Pattern" do

  it "delegates all functionality to the real object" do
    hero = Hero.new
    computer = double("computer", queue: [], add: [], execute: true)
    Computer.stub(:new).and_return(computer)
    proxy = ComputerProxy.new(hero)

    computer.should_receive(:add)
    proxy.add(double("command"))

    hero.keywords << :computer
    computer.should_receive(:execute)
    proxy.execute
  end

end