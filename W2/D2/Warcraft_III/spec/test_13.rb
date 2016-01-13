require_relative 'spec_helper'

describe Unit do

  before :each do
    @unit = Unit.new(100,3)
    @enemy = Unit.new(200,5)
  end

  describe "#damage" do
    it "cannot be dealt to a dead unit" do
      expect(@unit).to receive(:health_points).and_return(0)
      expect(@unit.attack!(@enemy)).to eq(nil)
    end
  end
  describe "#damage" do
    it "cannot deal to other unit in a state of being dead" do
      expect(@enemy).to receive(:health_points).and_return(0)
      expect(@unit.attack!(@enemy)).to eq(nil)
    end
  end
end
