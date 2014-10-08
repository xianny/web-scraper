require 'nokogiri'
require 'open-uri'
require_relative 'post'
require_relative 'comment'
require_relative 'extract'

class Scrape
  attr_accessor :url, :html_file, :doc

  ## takes the path of the file you want to convert
  def initialize(url)
    @url = url
    make_nokogiri_file
  end

  ## takes url set in `initialize` and create nokogiri file
  def make_nokogiri_file
    html_file = open(url)
    @doc = Nokogiri::HTML(File.open(html_file))
    create_post
  end

  ## creates a new Post object 
  def create_post
    title = Extract.title(@doc)
    url = Extract.title_url(@doc)
    points = Extract.points(@doc) 
    item_id = Extract.post_item_id(@doc) 
    poster = Extract.original_poster(@doc)
    post = Post.new(title, url, points, item_id, poster)
    parse_comments(post)
  end

  ## creates a new Comment object for each comment, adding it to the Post
  def parse_comments(post)
    comments = Extract.comments(@doc)
    usernames = Extract.usernames(@doc)
    for i in 0...comments.length
      post.add_comment(Comment.new(usernames[i],comments[i]))
    end
    post.display
  end

end

