require 'spec_helper'
require_relative '../lib/iterator'

describe "Iterator Pattern" do

  describe Inventory do

    it "adds items to its collection" do
      item1 = Item.new
      item1.cost = 20

      item2 = Item.new
      item2.cost = 10

      inventory = Inventory.new
      inventory.add(item1)
      inventory.add(item2)

      expect(inventory.items.size).to eq(2)
    end

  end

  describe Item do
    let(:item) { Item.new }
    it "has cost" do
      expect(item.cost).to eq(0)
    end
  end

end