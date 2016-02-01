class Song < ActiveRecord::Base

  belongs_to :user
  has_many :upvotes
  has_many :comments

  validates :title, presence: true
  validates :artist, presence: true

  

end