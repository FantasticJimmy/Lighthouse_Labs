require_relative 'spec_helper'

describe Submarine do
  before :each do
    @submarine = Submarine.new
  end

  describe '#descend' do
    it 'takes the sub deeper into the ocean' do
      @submarine.dive!
      original_depth = @submarine.depth
      @submarine.descend
      expect(@submarine.depth).to eq(original_depth - 500)
    end

    it "only works if the submarine is under water" do
      @submarine.descend
      expect(@submarine.depth).to eq(Ocean::SURFACE)
    end

    it "doesn't let the sub go deeper than -2000" do
      @submarine.dive!
      3.times { @submarine.descend }
      original_depth = @submarine.depth
      expect(original_depth).to eq(Ocean::MAX_DEPTH)
      @submarine.descend
      expect(@submarine.depth).to eq(original_depth)
    end
  end

  describe '#ascend' do
    it 'allows the sub to get closer to the surface by 500m' do
      @submarine.dive!
      @submarine.descend
      original_depth = @submarine.depth
      @submarine.ascend
      expect(@submarine.depth).to eq(original_depth + 500)
    end

    it "only works if the submarine is under water and not directly under the surface" do
      @submarine.dive!
      original_depth = @submarine.depth
      @submarine.ascend
      expect(@submarine.depth).to eq(original_depth)
    end

    it "doesn't work if the submarine is already on the surface" do
      @submarine.ascend
      expect(@submarine.depth).to eq(Ocean::SURFACE)
    end
  end

  describe '#surface' do
    it "can't surface the submarine when its in deeper waters" do
      @submarine.dive!
      @submarine.descend
      @submarine.surface
      expect(@submarine.depth).to_not eq(Ocean::SURFACE)
    end
  end
end
