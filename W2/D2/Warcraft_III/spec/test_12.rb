require_relative 'spec_helper'

describe Unit do

  before :each do
    @unit = Unit.new(100,3)
  end

  describe "#dead status" do
    it "is true when health point is equal to 0" do
      expect(@unit).to receive(:health_points).and_return(0)
      expect(@unit.dead?).to eq(true)
    end
  end
end
