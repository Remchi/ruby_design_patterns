require 'spec_helper'
require_relative '../lib/factory'

describe "Factory Pattern" do

  it "is a party of warriors" do
    party = WarriorParty.new(3)
    expect(party.members.count { |member| member.class == Warrior}).to eq(3)
  end

  it "is a party of mages" do
    party = MageParty.new(3)
    expect(party.members.count { |member| member.class == Mage}).to eq(3)
  end

end