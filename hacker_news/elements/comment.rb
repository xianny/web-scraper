module HackerNews
  module Elements
    class Comment
      attr_accessor :poster, :text

      def initialize(poster, text)
        @poster = poster
        @text = text
      end

    end
  end
end