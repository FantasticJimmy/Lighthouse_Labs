class Movie < ActiveRecord::Base

  has_many :reviews

  validates :title,
    presence: true



  validates :director, presence: true
  validates :runtime_in_minutes, numericality: {only_integer: true}
  validates :description, presence: true
  validates :poster_image_url, presence: true
  validates :release_date, presence: true
  validate :release_date_in_the_past

  mount_uploader :image, ImageUploader

  scope :title_director_search, ->(keyword){where("director LIKE ? OR title LIKE ?","%#{keyword}%","%#{keyword}%")}
  scope :length_search, ->(size){
    case size
      when "s"
        where("runtime_in_minutes < 90")
      when "m"
        where("runtime_in_minutes <= 120 AND runtime_in_minutes >= 90")
      when "l"
        where("runtime_in_minutes > 120")
      when "all"
        nil
    end}

  def review_average
    if reviews.size == 0
      0
    else
      reviews.sum(:rating_out_of_ten)/reviews.size
    end
  end


  protected

  def release_date_in_the_past
    if release_date.present?
      errors.add(:release_date, "should be in the past") if release_date >= Date.today
    end
  end 

end
