require 'spec_helper'
require_relative '../lib/observer_pattern'

describe "Observer Pattern" do

  describe Hero do
    let(:hero) { Hero.new }

    it "is cursed when discovers cursed Tile" do
      tile = Tile.new cursed: true
      hero.discover(tile)

      expect(hero.cursed?).to be_true
    end

    it "is not cursed when discovers simple Tile without curse" do
      tile = Tile.new
      hero.discover(tile)

      expect(hero.cursed?).to be_false
    end

    it "has default health equal to 10" do
      expect(hero.health).to eq(10)
    end
    it "can be damaged" do
      hero.damage(6)
      expect(hero.health).to eq(4)
    end
  end

  describe Tile do

    it "activates curse" do
      hero = Hero.new
      tile = Tile.new cursed: true
      hero.discover(tile)

      tile.activate_curse
      expect(hero.health).to eq(6)
    end

    it "activates curse on several heroes" do
      hero1 = Hero.new
      hero2 = Hero.new
      tile = Tile.new cursed: true
      hero1.discover(tile)
      hero2.discover(tile)

      tile.activate_curse
      expect(hero1.health).to eq(6)
      expect(hero2.health).to eq(6)
    end

    it "is not cursed by default" do
      tile = Tile.new
      expect(tile.cursed?).to be_false
    end
    it "can be created as cursed" do
      tile = Tile.new cursed: true
      expect(tile.cursed?).to be_true
    end
  end

end