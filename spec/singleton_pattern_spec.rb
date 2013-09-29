require 'spec_helper'
require_relative '../lib/singleton_pattern'

describe "Singleton Pattern" do

  let(:factory) { HeroFactory.instance }

  it "returns instance of HeroFactory" do
    expect(factory).to be_instance_of(HeroFactory)
  end

  it "is the same object even when we get 'another' instance" do
    another_factory = HeroFactory.instance
    expect(another_factory).to eq(factory)
  end

  it "has no access to 'new' method" do
    expect { HeroFactory.new }.to raise_exception
  end

end