require 'spec_helper'
require_relative '../lib/decorator'

describe "Decorator Pattern" do

  describe Item do
    let(:common_item) { Item.new }

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