require './spec_helper'

describe Booking do

  before :each do
    # A single night booking, as per dates set in factory
    @booking = FactoryGirl.build :booking
  end

  describe '#nights' do
    it "returns 1 when checkout date is day after checkin date" do
      expect(@booking.nights).to eq 1
    end

    it "returns 3 when checkout date is 3 days after checkin date" do
      @booking.checkin  = Date.today
      @booking.checkout = 3.days.from_now.to_date
      expect(@booking.nights).to eq 3

      @booking.checkin  = 3.days.from_now.to_date
      @booking.checkout = 6.days.from_now.to_date
      expect(@booking.nights).to eq 3
    end
  end

  describe '#market_cost' do
    it "should be calculated based on nights and suite rate (ignoring any discounts)" do
      @booking.suite.rate = 110
      @booking.checkin    = Date.today
      @booking.checkout   = 3.days.from_now.to_date

      expect(@booking.market_cost).to eq 330
    end
  end

  describe '#final_cost' do
    it "should include nightly_discount" do
      @booking.checkin            = Date.today
      @booking.checkout           = 3.days.from_now.to_date
      @booking.suite.rate         = 110
      @booking.nightly_discount   = 10

      expect(@booking.final_cost).to eq 300
    end
  end

end
