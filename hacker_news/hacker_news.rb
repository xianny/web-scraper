require 'colorize'
require 'nokogiri'
require_relative 'extract'
require_relative 'command_line_display'
require_relative 'elements/elements'

module HackerNews
  class Parser
    include Extract
    attr_reader :doc

    def run(doc)
      @doc = doc
      page = create_post
    end

    def create_post
      post = Elements::Post.new(title(@doc), title_url(@doc), points(@doc), post_item_id(@doc), original_poster(@doc))
      post = parse_comments(post)
    end

    ## creates a new Comment object for each comment, adding it to the Post
    def parse_comments(post)
      comments = comments(@doc)
      usernames = usernames(@doc)
      for i in 0...comments.length
        post.add_comment(Elements::Comment.new(usernames[i],comments[i]))
      end
      post
    end

  end
end