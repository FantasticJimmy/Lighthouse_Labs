require_relative 'spec_helper'

describe Submarine do
  before :each do
    @submarine = Submarine.new
  end

  describe 'default vertical position' do
    it "should be initially on the surface" do
      expect(@submarine.depth).to eq(Ocean::SURFACE)
    end
  end

  describe '#dive!' do
    it 'submerges the submarine into the water' do
      @submarine.dive!
      expect(@submarine.depth).to eq(Ocean::SURFACE - 500)
    end

    it "can't do anything if the submarine is already submerged" do
      @submarine.dive!
      @submarine.dive!
      expect(@submarine.depth).to eq(Ocean::SURFACE - 500)
    end
  end

  describe '#surface' do
    it 'brings the sub out of the water if its just below the surface' do
      @submarine.dive!
      @submarine.surface
      expect(@submarine.depth).to eq(Ocean::SURFACE)
    end
  end
end
