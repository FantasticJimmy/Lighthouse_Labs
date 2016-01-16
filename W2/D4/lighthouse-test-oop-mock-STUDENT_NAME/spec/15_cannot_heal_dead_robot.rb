require_relative 'spec_helper'

describe Robot do
  before :each do
    @robot = Robot.new
  end

  describe "#heal!" do
    it "should raise an exception when healing the dead robot" do
      @robot.wound(100)
      expect{@robot.heal!(10)}.to raise_error(HealingError)
    end
  end
end