require_relative 'spec_helper'

describe Robot do
  before :each do
    @robot = Robot.new
    @ed = Robot.new
    @jimmy = Robot.new
    @kat = Robot.new
    @yoojing = Robot.new
  end

  describe "#show positions" do
    it "should able to recognize all other robots' positions except for itself" do

      @robot.move_up
      @robot.move_up
      @robot.move_up
      @robot.move_up  
      @ed.move_down 
      @ed.move_down
      @ed.move_down 
      @ed.move_down
      @jimmy.move_down 
      @jimmy.move_down
      @jimmy.move_down 
      @jimmy.move_down 
      @yoojing.move_right
      @yoojing.move_right
      @yoojing.move_right
      @yoojing.move_right  
      @kat.move_left
      @kat.move_left
      @kat.move_down
      expect(@kat.show_robots_positions_without_myself).to eql([[0,4],[0,-4],[0,-4],[4,0]])

    end
   end

  end