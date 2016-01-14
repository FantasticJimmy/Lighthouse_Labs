class Post

  attr_reader :points, :related_comment, :title, :url, :item_id

  def initialize(title,url,points,item_id)
    @title = title
    @url = url
    @points = points
    @item_id = item_id
    @related_comment = []
  end

  def comments
    @related_comment.each do |comment|
    comment.display
    end
  end

  def add_comment(comment)
    @related_comment << comment
  end
  
end