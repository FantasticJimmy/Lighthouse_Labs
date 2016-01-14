require 'nokogiri'
require 'pry'
require './Class_Post'
require './Class_Comment'
require 'open-uri'
require 'colorize'

class Main 
  
  def self.begin(argv)
    html_file = open(argv[0])

    doc = Nokogiri::HTML(File.open(html_file))
    users = []
    doc.css("span.comhead a").each_with_index{|v,i| users << v.inner_text if i.odd?}

    date_commented = []
    doc.css("span.comhead a").each_with_index{|v,i| date_commented << v.inner_text if i.even?}
    date_commented.shift

    detail = []
    doc.css("span.comment").each{|x| detail << x.text}


    title = doc.css("title").text
    url = doc.css("td.title a")[0]['href'].to_s
    points = doc.css("span.score").text.to_i
    post_id = doc.css("tr td span.score").to_s.match(/_(\d*)/)[1]

    post = Post.new(title,url,points,post_id)

    i = 0
    while i < detail.length do
    comment = Comment.new(users[i],date_commented[i],detail[i],i+1)
    post.add_comment(comment)
    i = i + 1
    end

    puts "Post title: #{title}"
    puts "Number of comments: #{Comment.count}"
    puts "Points: #{points}"
    puts "Post ID: #{post_id}"
    puts "url: #{url}"
    puts 'Type "-show" to show all the comments concerning the above post, or "-visit" to visit the original post website'
    # binding.pry
    if (STDIN.gets.chomp == "-show")
      post.comments
    end
  end

end
argv = ARGV
Main.begin(argv)