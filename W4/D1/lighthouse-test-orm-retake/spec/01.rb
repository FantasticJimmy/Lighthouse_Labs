require './spec_helper'

describe Booking do

  before :each do
    @booking = Booking.new
    @suite = Suite.new
  end

  describe "associations" do
    it "should be able to get their suite" do
      expect {@booking.suite }.to_not raise_error
    end

    it "should be able to set their suite" do
      expect { @booking.suite = @suite }.to_not raise_error
    end
  end

end

describe Suite do

  before :each do
    @suite = Suite.new
  end

  describe "associations" do
    it "should be able to get their bookings" do
      expect { @suite.bookings }.to_not raise_error
    end

    it "should be able to set their bookings" do
      expect { @suite.bookings.new }.to_not raise_error
    end
  end

end
