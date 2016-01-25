class Employee < ActiveRecord::Base

  belongs_to :store

  validates :first_name, presence: true
  validates :last_name, presence: true

  after_create :increase_store_employees_by_1
  after_destroy :decrease_store_employees_by_1

  after_create :annual_salary

  def annual_salary
    hourly_rate * 1950
  end

  def self.average_hourly_rate_for(gender=nil)
    if gender.nil?
      annual_salary_expense = all.reduce(0) {|memo, employee|memo += employee.annual_salary}
      average_hourly_rate = annual_salary_expense.to_f / (Employee.all.count * 1950)
      average_hourly_rate.round(2)
    else
      annual_salary_expense = Employee.where(gender: gender).reduce(0) {|memo, employee|memo += employee.annual_salary}
      average_hourly_rate = annual_salary_expense.to_f / (Employee.where(gender: gender).count * 1950)
      average_hourly_rate.round(2)
    end
  end


  private
  def increase_store_employees_by_1
    if gender == "F"
      store.female_employees += 1
      store.save
    elsif gender == "M"
      store.male_employees += 1
      store.save
    end
  end

  def decrease_store_employees_by_1
    if gender == "F"
      store.female_employees -= 1
      store.save
    elsif gender == "M"
      store.male_employees -= 1
      store.save
    end  
  end
  
end
