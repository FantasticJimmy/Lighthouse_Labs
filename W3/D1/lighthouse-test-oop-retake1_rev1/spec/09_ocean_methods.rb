require_relative 'spec_helper'

describe Ocean do
  describe '.fish' do
    it 'returns a giant salmon if there is an S at the position' do
      fish = Ocean.fish(-500, 3)
      expect(fish).to be_a(GiantSalmon)
    end

    it 'returns a giant tuna if there is a T at the position' do
      fish = Ocean.fish(-1000, 0)
      expect(fish).to be_a(GiantTuna)
    end

    it 'returns nothing if there is nothing (~) at the position' do
      fish = Ocean.fish(-500, 1)
      expect(fish).to be_nil
    end
  end
end
