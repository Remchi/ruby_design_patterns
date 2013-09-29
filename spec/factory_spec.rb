require 'spec_helper'
require_relative '../lib/factory'

describe "Factory Pattern" do

  it "is a party of warriors" do
    party = PartyFactory.new(3, :warrior)
    expect(party.members.count { |member| member.class == Warrior}).to eq(3)
  end

  it "is a party of mages" do
    party = PartyFactory.new(3, :mage)
    expect(party.members.count { |member| member.class == Mage}).to eq(3)
  end

end