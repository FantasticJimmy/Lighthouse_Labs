require_relative 'spec_helper'

describe GiantTuna do
  describe "#value_per_kg" do
    it "should be 12.5" do
      tuna = GiantTuna.new
      expect(tuna.value_per_kg).to eq(12.5)
    end
  end
end

describe GiantSalmon do
  describe "#value_per_kg" do
    it "should be 7.5" do
      salmon = GiantSalmon.new
      expect(salmon.value_per_kg).to eq(7.5)
    end
  end
end

describe Fish do
  context "weighing 5 kgs selling for 50 each" do
    describe "#value_per_kg" do
      it "should be 10.0" do
        fish = Fish.new(5, 50)
        expect(fish.value_per_kg).to eq(10.0)
      end
    end
  end

  context "weighing 6 kgs selling for 30 each" do
    describe "#value_per_kg" do
      it "should be 5.0" do
        fish = Fish.new(6, 30)
        expect(fish.value_per_kg).to eq(5.0)
      end
    end
  end
end
