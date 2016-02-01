require './spec_helper'

describe Suite do

  describe '#bookings' do
    it "are destroyed once suite is destroyed" do
      
      suite = FactoryGirl.create :suite
      booking1 = FactoryGirl.create :previous_booking, suite: suite
      booking2 = FactoryGirl.create :previous_booking, suite: suite
      booking_for_another_suite = FactoryGirl.create :booking
      
      suite.destroy

      expect(Booking.find_by_id(booking1.id)).to be_nil
      expect(Booking.find_by_id(booking2.id)).to be_nil
      expect(Booking.find_by_id(booking_for_another_suite.id)).to be_a(Booking)
    end
  end

end
