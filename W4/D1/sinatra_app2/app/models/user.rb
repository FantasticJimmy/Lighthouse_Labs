class User < ActiveRecord::Base

  has_many :songs
  has_many :upvotes
  has_many :comments


  validates :name, presence: true, length: {minimum: 3}
  validates :password, presence: true

  

end