class Student < ActiveRecord::Base
  # implement your Student model here
  belongs_to :teacher
  validates :email, format: { with: /.*@.*\.\D{2}/}, uniqueness: true
  # validates :birthday

  # def store_must_have_one_type
  #   if self.birthday - 3.year
  #     errors.add(:mens_apparel, "You gotta at least sell to human being.")
  #   end
  # end
                           

  def name
    self.first_name + " " + self.last_name
  end

  def age
    Date.today.year - self.birthday.year - ((Date.today.month > self.birthday.month || (Date.today.month == self.birthday.month && Date.today.day >= self.birthday.day)) ? 0 : 1)
  end 

end
