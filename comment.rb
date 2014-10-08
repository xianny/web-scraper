class Comment
  attr_accessor :poster, :text

  def initialize(poster, text)
    @poster = poster
    @text = text
  end

  ## displays the comment
  def display
    puts "#{poster} commented:"
    puts "#{text}"
    puts "--------------------------------------------"
  end

end