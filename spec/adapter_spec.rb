require 'spec_helper'
require_relative '../lib/adapter'

describe "Adapter Pattern" do

  describe "Finishing quest" do
    it "rewards hero with experience points" do
      # difficulty * 50 / hero_level
      hero = Hero.new
      quest = Quest.new(5)

      hero.take_quest(quest)
      hero.finish_quest(quest)

      expect(hero.exp).to eq(250)
    end
  end

  describe "Finishing OLD quest" do
    it "rewards hero with experience points" do
      hero = Hero.new
      quest = QuestAdapter.new(OldQuest.new, 5)

      hero.take_quest(quest)
      hero.finish_quest(quest)

      expect(hero.exp).to eq(50)
    end
  end

end