require_relative 'spec_helper'

describe Submarine do
  before :each do
    @submarine = Submarine.new
  end

  it 'starts with empty cargo' do
    expect(@submarine.cargo).to eq([])
  end

  describe '#sushiable_fishes' do
    it "returns the number of fishes in the cargo that can be sushified (Salmon + Tuna x2)" do
      @submarine.cargo = [Shark.new, GiantSalmon.new, GiantTuna.new, GiantTuna.new]
      expect(@submarine.sushiable_fishes).to eq(3)
    end

    it "returns the number of fishes in the cargo that can be sushified (Tuna x2)" do
      @submarine.cargo = [Shark.new, GiantTuna.new, GiantTuna.new]
      expect(@submarine.sushiable_fishes).to eq(2)
    end

    it "returns 0 when you've only caught Shark" do
      @submarine.cargo = [Shark.new, Shark.new, Shark.new]
      expect(@submarine.sushiable_fishes).to eq(0)
    end
  end
end
