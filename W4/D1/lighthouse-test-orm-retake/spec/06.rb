require './spec_helper'


describe Suite do
  
  before :each do
    @suite = FactoryGirl.create :suite
    @booking1 = FactoryGirl.build :booking, suite: @suite
    @booking2 = FactoryGirl.build :booking, suite: @suite
    @booking_for_another_suite = FactoryGirl.build :booking
  end

  describe '#revenue (database field)' do
    it "is increased by booking's final_cost when a booking is created" do
      expect(@suite.revenue).to eq 0

      expect(@booking1).to receive(:final_cost).and_return(100)
      @booking1.save

      expect(@suite.reload.revenue).to eq 100

      expect(@booking2).to receive(:final_cost).and_return(200)
      @booking2.save

      expect(@suite.revenue).to eq 300
    end
    it "is not increased by some other suite's booking" do
      expect(@suite.revenue).to eq 0

      @booking_for_another_suite.save

      expect(@suite.reload.revenue).to eq 0
    end
    it "is decreased by booking's final_cost if booking is destroyed" do
      allow(@booking1).to receive(:final_cost).and_return(100)
      @booking1.save

      @suite.update_attributes! revenue: 5100

      @booking1.destroy # suite revenue should reduce by 100

      expect(@suite.reload.revenue).to eq 5000
    end
  end

end

describe Booking do

  context 'without a suite' do
    
    before :each do
      @booking = FactoryGirl.build :booking, suite: nil
    end

    describe 'creation' do
      it "should work fine" do
        @booking.save
        expect(@booking).to be_valid
      end
    end

    describe 'destruction' do
      it "should work fine" do
        @booking.save
        @booking.destroy
        expect(Booking.find_by_id(@booking.id)).to be_nil
      end
    end
  end

end
