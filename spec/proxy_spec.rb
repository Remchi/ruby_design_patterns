require 'spec_helper'
require_relative '../lib/proxy'

describe "Proxy Pattern" do

  it "delegates all functionality to the real object" do
    computer = double("computer", queue: [], add: [], execute: true)
    proxy = ComputerProxy.new(computer)

    computer.should_receive(:add)
    proxy.add(double("command"))

    computer.should_receive(:execute)
    proxy.execute
  end

end