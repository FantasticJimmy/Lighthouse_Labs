require_relative 'spec_helper'

describe Submarine do
  before :each do
    @submarine = Submarine.new
  end

  describe "#total_revenue" do
    it "should be 0" do
      expect(@submarine.total_revenue).to eq(0)
    end
  end

  describe '#sell_cargo' do
    it 'is allowed on the surface' do
      expect(@submarine.sell_cargo).to eq(true)
    end

    it 'is not allowed under water' do
      @submarine.dive!
      expect(@submarine.sell_cargo).to eq(false)
    end

    it 'should empty out the cargo' do
      @submarine.cargo = [GiantSalmon.new, GiantTuna.new, GiantSalmon.new]
      @submarine.sell_cargo
      expect(@submarine.cargo).to eq([])
    end

    it "should increase the sub's total revenue by the appropriate amount" do
      # Set cargo to 85 dollars worth of fish
      @submarine.cargo = [GiantSalmon.new, GiantTuna.new, GiantSalmon.new]
      @submarine.sell_cargo
      expect(@submarine.total_revenue).to eq(85)
      # Give the sub 60 more dollars worth of fish
      @submarine.cargo = [GiantSalmon.new, GiantSalmon.new]
      @submarine.sell_cargo
      expect(@submarine.total_revenue).to eq(145)
    end
  end
end
