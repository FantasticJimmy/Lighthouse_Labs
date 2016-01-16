require_relative 'spec_helper'

describe Robot do
  before :each do
    @robot = Robot.new
    @shield = Shield.new
    @jimmy = Robot.new
    @cannon = PlasmaCannon.new
    @grenade = Grenade.new
  end

  describe "shield" do
    it "block the potion of damage" do
      @robot.pick_up(@shield)
      @jimmy.pick_up(@cannon)
      @jimmy.attack(@robot)
      expect(@robot.health).to equal(95)
   end
  end
  
  describe "shield" do
    it "block the potion of damage" do
      @robot.pick_up(@shield)
      @jimmy.pick_up(@grenade)
      @jimmy.attack(@robot)
      expect(@robot.health).to equal(100)
   end
  end

  describe "shield" do
    it "block the potion of damage" do
      @robot.pick_up(@shield)
      @jimmy.pick_up(@cannon)
      @jimmy.attack(@robot)
      @jimmy.pick_up(@cannon)
      @jimmy.attack(@robot)
      expect(@robot.health).to equal(40)
   end
  end 
end