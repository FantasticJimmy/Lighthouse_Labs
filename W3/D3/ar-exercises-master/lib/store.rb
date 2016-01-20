class Store < ActiveRecord::Base

  has_many :employees
  validates :name, length: {minimum: 3}
  validates :annual_revenue, numericality: {greater_than: 0}
  validate :store_must_have_one_type

  def store_must_have_one_type
    if !mens_apparel && !womens_apparel
      errors.add(:mens_apparel, "You gotta at least sell to human being.")
      errors.add(:womens_apparel, "You gotta at least sell to human being.")
    end
  end

end
