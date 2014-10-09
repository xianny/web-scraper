module HackerNews
  class CommandLineDisplay
    attr_reader :page


      ## Takes a single page from Hacker News (converted to Elements::Post Object) and displays it on command line
      def run(page)
        @page = page
        display_page
      end

      def display_page
        display_post
        display_comments
      end

      ## Takes an Elements::Post object and puts it to command line
      def display_post
        puts "--------------------"
        puts "Title:   #{@page.title}"
        puts "URL:     #{@page.url}"
        puts "Item ID: #{@page.item_id}"
        puts "Posted by #{@page.poster}. #{@page.points} points, #{@page.comments.length} comments."
        puts "--------------------"
      end

      ## Puts all associated Elements::Comment Objects to the command line
      def display_comments
        @page.comments.each do |comment|
          display(comment)
        end
      end

      ## Takes an Elements::Comment object and puts it to command line
      def display(comment) 
        puts "#{comment.poster} commented:".green
        puts "#{comment.text}"
        puts "--------------------"
      end

  end
end