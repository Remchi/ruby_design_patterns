require 'spec_helper'
require_relative '../lib/template_method'

describe "Template Method Pattern" do

  context "Default Hero" do
    let(:hero) { Hero.new }

    it "has default damage rating of 10" do
      expect(hero.damage).to eq(10)
    end
    it "can attack" do
      expect(hero.attack).to eq("Attacked dealing 10 damage")
    end
  end

  context "Warrior" do
    let(:hero) { Hero.new :warrior }

    it "has default damage rating of 15" do
      expect(hero.damage).to eq(15)
    end
  end
end