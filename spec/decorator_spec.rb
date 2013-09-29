require 'spec_helper'
require_relative '../lib/decorator'

describe "Decorator Pattern" do

  describe Item do
    let(:common_item) { Item.new }

    context "magic item" do
      let(:magic_item) { MagicItemDecorator.new(common_item)}

      it "three times more expensive than common item" do
        expect(magic_item.price).to eq(common_item.price * 3)
      end
      it "has addition do description" do
        expect(magic_item.description).to eq(common_item.description + "Magic.")
      end
    end

    context "magic masterpiece item" do
      let(:full_item) { MasterpieceItemDecorator.new(MagicItemDecorator.new(common_item)) }

      it "six times more expensive than common item" do
        expect(full_item.price).to eq(common_item.price * 6)
      end
      it "has addition do description" do
        expect(full_item.description).to eq(common_item.description + "Magic.Masterpiece.")
        full_item = MagicItemDecorator.new(MasterpieceItemDecorator.new(common_item))
        expect(full_item.description).to eq(common_item.description + "Masterpiece.Magic.")
      end
    end

    context "masterpiece item" do
      let(:masterpiece_item) { MasterpieceItemDecorator.new(common_item) }

      it "two times more expensive than common item" do
        expect(masterpiece_item.price).to eq(common_item.price * 2)
      end
      it "has addition do description" do
        expect(masterpiece_item.description).to eq(common_item.description + "Masterpiece.")
      end
    end

    context "common item" do

      it "has price" do
        expect(common_item.price).to eq(10)
      end
      it "has description" do
        expect(common_item.description).to eq("Item.")
      end
      it "can be used" do
        expect(common_item).to respond_to(:use)
      end

    end

  end

end