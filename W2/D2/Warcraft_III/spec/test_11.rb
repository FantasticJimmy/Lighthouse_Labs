require_relative 'spec_helper'

describe Barracks do

  before :each do
    @barrack = Barracks.new
    @footman = Footman.new
  end

  describe "#damage" do
    it "should only be deal at the value of half of the attacker's AP if the attacker is not a siege" do
      @barrack.damage(@footman)
      expect(@barrack.health_points).to eq(495)
    end
  end
end
