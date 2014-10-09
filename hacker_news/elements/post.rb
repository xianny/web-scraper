module HackerNews
  module Elements
    class Post
      attr_reader :title, :url, :points, :item_id, :poster, :comments

      def initialize(title,url,points,item_id,poster)
        @title = title
        @url = url
        @points = points
        @item_id = item_id
        @poster = poster
        @comments = []
      end

      ## Takes a Comment object and adds it to the comments associated with this post
      def add_comment(comment)
        @comments << comment
      end

    end
  end
end