class Student < ActiveRecord::Base
  # implement your Student model here
  belongs_to :teacher
  validates :email, format: { with: /.*@.*\.\D{2}/}, uniqueness: true
  validate :cant_be_assigned_to_retired_teacher
  after_save :last_student_added_at, if: :teacher 
  # validates :birthday

  # def store_must_have_one_type
  #   if self.birthday - 3.year
  #     errors.add(:mens_apparel, "You gotta at least sell to human being.")
  #   end
  # end
  def cant_be_assigned_to_retired_teacher
    if teacher && teacher.retirement_date
      errors.add(:teacher_id,"Students cannot be assigned to retiring teachers.")
    end
  end

  def last_student_added_at
    teacher.last_student_added_at = Date.today
    teacher.save
  end
                            

  def name
    first_name + " " + last_name
  end

  def age
    Date.today.year - self.birthday.year - ((Date.today.month > self.birthday.month || (Date.today.month == self.birthday.month && Date.today.day >= self.birthday.day)) ? 0 : 1)
  end 

end
