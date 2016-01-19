require_relative 'spec_helper'

describe Robot do
  before :each do
    @robot = Robot.new
    @ed = Robot.new
    @jimmy = Robot.new
    @kat = Robot.new
    @yoojing = Robot.new
  end

  describe "#scan" do
    it "scan sournding for robots" do
      @robot.move_up
      @robot.move_up
      @robot.move_up
      @robot.move_up  
      @ed.move_up 
      @ed.move_up
      @ed.move_up
      @ed.move_right
      @jimmy.move_down 
      @jimmy.move_down
      @jimmy.move_down 
      @jimmy.move_down 
      @yoojing.move_right
      @yoojing.move_up
      @yoojing.move_up
      @yoojing.move_up 
      @kat.move_left
      @kat.move_up
      @kat.move_up
      @kat.move_up


      expect(@robot.scann).to eql([@ed,@yoojing,@kat]||[@yoojing,@ed,@kat])

    end
   end

  end


