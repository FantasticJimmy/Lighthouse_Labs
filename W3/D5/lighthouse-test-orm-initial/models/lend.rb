class Lend < ActiveRecord::Base

  belongs_to :book
  belongs_to :library
  validates :checkout, presence: true
  validate :due_date_later_than_checkout, if: :due
  validate :checkin_date_later_than_checkout, if: :checkin
  after_save :increase_revenue
  after_save :change_extended_status

  def increase_revenue
    library.revenue += fees
    library.save
    library.revenue
  end

  def fees
    if checkin
      library.late_fee * (checkin - due).to_i
    else
      library.late_fee * 0
    end unless !overdue?
  end

  def days
    (due - checkout).to_i
  end

  def overdue? 
    !(checkin) || (checkin > due)    
  end

  private 

  def due_date_later_than_checkout
    if checkout > due
      errors.add(:due, "due date must be after checkout")
    end
  end 

  def checkin_date_later_than_checkout
    if checkout > checkin
      errors.add(:checkin, "checkin date must be after checkout")
    end
  end 

  def change_extended_status
    self.extended = true if self.days > 2
  end

end
