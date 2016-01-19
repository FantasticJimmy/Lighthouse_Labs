require_relative 'spec_helper'

describe Submarine do
  before :each do
    @submarine = Submarine.new
  end

  describe 'default lateral position' do
    it "should be at the origin" do
      expect(@submarine.tile).to eq(0)
    end
  end

  describe 'lateral movement' do
    describe '#forward' do
      it 'does not affect the depth of the sub' do
        original_depth = @submarine.depth
        @submarine.forward
        expect(@submarine.depth).to eq(original_depth)
      end

      it 'moves the sub forward (towards the right) in the ocean' do
        @submarine.forward
        expect(@submarine.tile).to eq(1)
      end

      it "doesn't allow the sub to move past the right edge of the ocean" do
        Ocean::MAX_TILE.times do
          @submarine.forward
        end
        @submarine.forward
        expect(@submarine.tile).to eq(Ocean::MAX_TILE)
      end
    end

    describe '#backward' do
      it 'does not affect the depth of the sub' do
        original_depth = @submarine.depth
        @submarine.backward
        expect(@submarine.depth).to eq(original_depth)
      end

      it 'moves the sub backward (towards the left) in the ocean' do
        @submarine.forward
        @submarine.backward
        expect(@submarine.tile).to eq(0)
      end

      it "doesn't allow the sub to move past the left edge of the ocean" do
        @submarine.backward
        expect(@submarine.tile).to eq(0)
      end
    end
  end
end
