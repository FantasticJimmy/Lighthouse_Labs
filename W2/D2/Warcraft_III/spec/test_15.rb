require_relative 'spec_helper'

describe Siege do

  before :each do
    @barrack = Barracks.new
    @siege = Siege.new
    @siege_1 = Siege.new
    @footman = Footman.new
  end

  describe "#damage" do
    it "deal double the damage to barracks" do
      @siege.attack!(@barrack)
      expect(@barrack.health_points).to eq(400)
    end
  end
  describe "#damage" do
    it "deal regular damage to Seige" do
      @siege.attack!(@siege_1)
      expect(@siege_1.health_points).to eq(350)
    end
  end
  describe "#damage" do
    it "cannot attack footman" do
      @siege.attack!(@footman)
      expect(@footman.health_points).to eq(60)
    end
  end
end
