require_relative 'spec_helper'

describe Fish do
  describe 'weighing 1 kg and worth 15 dollars' do
    before :each do
      @fish = Fish.new(1, 15)
    end

    it "should weigh 1 kg" do
      expect(@fish.weight).to eq(1)
    end

    it "should be worth 15 dollars" do
      expect(@fish.value).to eq(15)
    end
  end

  describe 'weighing 3 kgs and worth 25 dollars' do
    before :each do
      @fish = Fish.new(3, 25)
    end

    it "should weigh 3 kg" do
      expect(@fish.weight).to eq(3)
    end

    it "should be worth 25 dollars" do
      expect(@fish.value).to eq(25)
    end
  end
end
