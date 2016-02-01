class Booking < ActiveRecord::Base

  belongs_to :suite

  validates :full_name, presence: true, length: {maximum: 50}
  validates :guests, numericality: {greater_than_or_equal_to: 1,less_than_or_equal_to: 6}
  after_create :increase_suite_revenue, if: :suite
  after_destroy :decrease_suite_revenue, if: :suite

  # ALl the comments in this file are design to solve booking without suite in 06.rb
  # after_save :assign_random_suite

  def nights
    checkout - checkin
  end

  def market_cost
    self.suite.rate * self.nights
  end

  def final_cost
    (self.suite.rate - self.nightly_discount) * self.nights
  end

  def increase_suite_revenue
    self.suite.revenue += self.final_cost
    self.suite.save
  end

  def decrease_suite_revenue
    self.suite.revenue -= self.final_cost
    self.suite.save
  end

  # def assign_random_suite
  #   if !self.suite
  #     @suite = FactoryGirl.create :suite
  #     self.suite = @suite
  #   end
  # end

end
