class Post
  attr_accessor :title, :url, :points, :item_id, :poster

  def initialize(title,url,points,item_id,poster)
    @title = title
    @url = url
    @points = points
    @item_id = item_id
    @poster = poster
    @comments = []
  end

  ##TODO returns all comments associated with this post
  def comments
    @comments.each do |comment|
      comment.display
    end
  end

  ##TODO takes a Comment object and adds it to the comments associated with this post
  def add_comment(comment)
    @comments << comment
  end

  def display
    puts "Post Title: #{title}"
    puts "Comments:   #{@comments.length}"
    puts "URL:        #{url}"
    puts "Posted by:  #{poster}"
    puts "#{points} points, item ID #{item_id}"
    puts "------------------------------------"
    puts "Comments begin:"
    comments
  end


end