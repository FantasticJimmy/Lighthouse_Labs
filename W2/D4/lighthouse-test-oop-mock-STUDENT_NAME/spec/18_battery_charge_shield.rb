require_relative 'spec_helper'

describe Robot do
  before :each do
    @robot = Robot.new
    @shield = Shield.new
    @jimmy = Robot.new
    @cannon = PlasmaCannon.new
    @battery = Battery.new
  end

  describe "battery" do
    it "charge the shield" do
      @robot.pick_up(@shield)
      @jimmy.pick_up(@cannon)
      @jimmy.attack(@robot)
      @jimmy.pick_up(@battery)
      @jimmy.pick_up(@battery)
      expect(@jimmy.shield_charge).to equal(20)
      @jimmy.set_robots
    end
   end
  end