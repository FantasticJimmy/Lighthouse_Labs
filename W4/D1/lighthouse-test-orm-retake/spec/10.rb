require './spec_helper'

describe Suite do
  
  before :each do
    @suite = FactoryGirl.create :suite
  end

  describe '#available_between?' do

    context "without any bookings" do
      it "should be considered available for any date" do
        expect(@suite.available_between?(Date.today, 1.day.from_now)).to be_truthy
      end
    end

    context "with a 4 night booking" do
      
      before :each do
        @booking = FactoryGirl.create :booking, suite: @suite, checkin: Date.today, checkout: 4.days.from_now.to_date 
      end

      it "considered unavailable if first part of booking overlaps with date range" do
        expect(@suite.available_between?(2.days.ago.to_date, 2.days.from_now.to_date)).to be_falsey
      end

      it "considered unavailable if latter part of booking overlap the date range" do
        expect(@suite.available_between?(2.days.from_now.to_date, 4.days.from_now.to_date)).to be_falsey
      end

      it "considered unavailable if booking surrounds the date range" do
        expect(@suite.available_between?(2.days.from_now.to_date, 3.days.from_now.to_date)).to be_falsey
      end

      it "considered unavailable if booking is completely within date range" do
        expect(@suite.available_between?(1.day.ago.to_date, 5.days.from_now.to_date)).to be_falsey
      end

      it "considered available if booking starts after the date range" do
        expect(@suite.available_between?(2.days.ago.to_date, 1.day.ago.to_date)).to be_truthy
      end

      it "considered available if booking ends before the date range" do
        expect(@suite.available_between?(5.days.from_now.to_date, 7.days.from_now.to_date)).to be_truthy
      end
      
    end

  end

end
