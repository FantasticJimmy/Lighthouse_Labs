class Store < ActiveRecord::Base

  has_many :employees

  validates :male_employees, :female_employees, numericality: {greater_than_or_equal_to: 0}

  validates :name,
    presence: true,
    length: {maximum: 25}
  validates :annual_revenue, numericality: {greater_than_or_equal_to: 0}


  def annual_expense
    employees.reduce(0) do |memo,employee|
      memo += employee.annual_salary
    end
  end

  def annual_profit
    annual_revenue - annual_expense
  end

  
end
