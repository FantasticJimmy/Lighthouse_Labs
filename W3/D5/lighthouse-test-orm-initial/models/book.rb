class Book < ActiveRecord::Base


  belongs_to :library

  validates :title, presence: true, length: {maximum: 500}
  validates :author, presence: true, length: {minimum: 5,maximum: 100}
  validates :pages, presence: true, numericality: {greater_than_or_equal_to: 4}
  validates :isbn, format: {with: /\b\d{9}-[\d|X]/,message: "is not a valid ISBN" }



  def available?  
    if !library.lends.find_by(book_id: self.id)|| library.lends.find_by(book_id: self.id).due == Date.today
      true
    else
      false
    end
  end

end

  