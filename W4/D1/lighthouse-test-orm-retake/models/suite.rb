class Suite < ActiveRecord::Base

  has_many :bookings, dependent: :destroy

  validates :number, presence: true, uniqueness: true, length: {maximum: 3}
  validates :rate, numericality: {greater_than: 0}
  validates :capacity, numericality: {greater_than: 0}

  def available_between?(a,b)
    if self.bookings == [] || (a > self.bookings[0].checkout)
      true 
    elsif b < self.bookings[0].checkin
      true
    end
  end

end
