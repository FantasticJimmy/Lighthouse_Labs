require './spec_helper'

describe Booking do

  before :each do
    @booking = FactoryGirl.build :booking
  end

  describe '#full_name' do
    it "is required" do
      @booking.full_name = nil
      expect(@booking).to_not be_valid
      expect(@booking.errors[:full_name]).to eq ["can't be blank"]
    end

    it "is a max of 50 characters" do
      @booking.full_name = 'a' * 51
      expect(@booking).to_not be_valid
      expect(@booking.errors[:full_name]).to eq ["is too long (maximum is 50 characters)"]
    end
  end

  describe '#guests' do
    it "is required (as a number)" do
      @booking.guests = nil
      expect(@booking).to_not be_valid
      expect(@booking.errors[:guests]).to eq ["is not a number"]
    end

    it "must be at least 1" do
      @booking.guests = 0
      expect(@booking).to_not be_valid
      expect(@booking.errors[:guests]).to eq ["must be greater than or equal to 1"]
    end

    it "must be at most 6" do
      @booking.guests = 7
      expect(@booking).to_not be_valid
      expect(@booking.errors[:guests]).to eq ["must be less than or equal to 6"]
    end
  end


end
