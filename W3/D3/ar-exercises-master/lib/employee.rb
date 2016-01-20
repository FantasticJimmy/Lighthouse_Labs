class Employee < ActiveRecord::Base

  belongs_to :store

  validates :store_id, presence: true, numericality: {greater_than: 0,less_than: 7}
  validates :hourly_rate, presence: true, numericality: {greater_than: 40,less_than: 200}


end
