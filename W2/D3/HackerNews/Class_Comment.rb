class Comment

  @@count = 0
  def initialize(username,date_created,detail,id)
    @username = username
    @date_created = date_created
    @detail = detail
    @id = id
    @@count += 1
  end

  def self.count
    @@count
  end

  def display
    arr = []
    String.colors.each{|color|arr << color}
    arr.pop
    puts "#{@date_created.colorize(:yellow)}, #{@username.colorize(:cyan)} commented:"
    puts @detail.colorize(arr[rand(15)])
  end
  
end