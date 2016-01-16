require_relative 'spec_helper'

describe Robot do
  before :each do
    @robot = Robot.new
    @bolts = BoxOfBolts.new
    @jimmy = Robot.new
  end

  describe "#attack!" do
    it "should not work on any object other than Robots" do
      expect{@robot.attack!(@bolts)}.to raise_error("Can only attack a Robot!")
    end
    it "should attack robots" do
      @robot.attack!(@jimmy)
      expect(@jimmy.health).to equal(95)
    end
  end
end