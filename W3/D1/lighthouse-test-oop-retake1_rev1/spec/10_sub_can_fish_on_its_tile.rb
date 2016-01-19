require_relative 'spec_helper'

describe Submarine do
  before :each do
    @submarine = Submarine.new
    @tuna = GiantTuna.new
    @salmon = GiantSalmon.new
  end

  it 'should have empty cargo' do
    expect(@submarine.cargo).to eq([])
  end

  describe '#fish' do
    it 'calls Ocean.fish with its current position' do
      @submarine.dive!
      @submarine.forward
      expect(Ocean).to receive(:fish).with(-500, 1)
      @submarine.fish
    end

    it 'does not call Ocean.fish if the sub is not submerged' do
      expect(Ocean).to_not receive(:fish)
      @submarine.fish
    end

    it 'adds the fished Salmon to its cargo' do
      @submarine.cargo = [@tuna]
      @submarine.dive!
      expect(Ocean).to receive(:fish).and_return(@salmon)
      @submarine.fish
      expect(@submarine.cargo).to eq([@tuna, @salmon])
    end
  end
end
