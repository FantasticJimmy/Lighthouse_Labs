class Teacher < ActiveRecord::Base

  has_many :students
  validates :email, uniqueness: true
  validates :retirement_date, :hire_date, presence: true
  validate :retirement_after_hire
  validate :retirement_date_after_today

  after_save :remove_student_if_retiring, if: :retirement_date

  def remove_student_if_retiring
    students.each{|student|student.teacher = nil;student.save}
  end

  def retirement_date_after_today
    if retirement_date && hire_date
      if Date.today < retirement_date
        errors.add(:retirement_date, "Retirement can't be predicated.")
      end
    end
  end


  def retirement_after_hire
    if retirement_date
      if hire_date > retirement_date
        errors.add(:retirement_date, "Retirement must be later than hire date.")
      end
    end
  end

end
