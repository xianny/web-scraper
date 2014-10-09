## Parses a Hacker News page/post, e.g. https://news.ycombinator.com/item?id=5003980

module HackerNews
  class Parser
    attr_reader :doc

    class << self

      def run(doc)
        @doc = doc
        page = create_post
      end

      ## TODO: minor: see about mixing in Extract module to reduce lines of code
      ## creates a new Post object with all associated comments
      def create_post
        title = Extract.title(@doc)
        url = Extract.title_url(@doc)
        points = Extract.points(@doc) 
        item_id = Extract.post_item_id(@doc) 
        poster = Extract.original_poster(@doc)
        post = Elements::Post.new(title, url, points, item_id, poster)
        post = parse_comments(post)
      end

      ## creates a new Comment object for each comment, adding it to the Post
      def parse_comments(post)
        post = post
        comments = Extract.comments(@doc)
        usernames = Extract.usernames(@doc)
        for i in 0...comments.length
          post.add_comment(Elements::Comment.new(usernames[i],comments[i]))
        end
        post
      end
    end
    

  end
end