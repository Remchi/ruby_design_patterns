require 'spec_helper'
require_relative '../lib/composite'

describe "Composite Pattern" do

  describe Quest do
    context "consists from Encounter and Diplomacy" do
      it "has reward of 600" do
        quest = Quest.new
        quest.add(Encounter.new)
        quest.add(Diplomacy.new)

        expect(quest.reward).to eq(600)
      end
    end
  end

  describe MegaQuest do
    it "consists from 2 quests and one Encounter" do
      quest1 = Quest.new
      quest1.add(Puzzle.new)
      quest1.add(Encounter.new)

      quest2 = Quest.new
      quest2.add(Puzzle.new)
      quest2.add(Diplomacy.new)

      mega = MegaQuest.new
      mega.add(quest1)
      mega.add(quest2)
      mega.add(Puzzle.new)

      expect(mega.reward).to eq(1200)
    end
  end

  describe Encounter do
    it "has experience reward of 100" do
      expect(Encounter.new.reward).to eq(100)
    end
  end
  describe Puzzle do
    it "has experience reward of 200" do
      expect(Puzzle.new.reward).to eq(200)
    end
  end
  describe Diplomacy do
    it "has experience reward of 500" do
      expect(Diplomacy.new.reward).to eq(500)
    end
  end

end