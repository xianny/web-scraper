require 'nokogiri'

## This Extract module extracts info from Hacker News pages, e.g. https://news.ycombinator.com/item?id=5003980

module Extract
  
  ## takes nokogiri doc and returns post title
  def self.title(doc)
    doc.search('.title > a:first-child').map { |link| link.inner_text }[0]
  end

  ## takes nokogiri doc and returns post title URL
  def self.title_url(doc)
    doc.search('.title > a:first-child').map { |link| link['href']}[0]
  end

  ## takes nokogiri doc and returns points for post
  def self.points(doc)
    points = doc.search('.subtext > span:first-child').map { |span| span.inner_text }
    points[0].match(/\d+/)
  end

  ## takes nokogiri doc and returns item_id for post
  def self.post_item_id(doc)
    href = doc.search('.subtext > a:nth-child(3)').map { |link| link['href'] }
    href[0].match(/\d+/)
  end  

  ## takes nokogiri doc and returns original poster for post
  def self.original_poster(doc)
    doc.search('.subtext > a:nth-child(2)').map { |link| link.inner_text }[0]
  end

  ## takes nokogiri doc and returns an array of all comments
  def self.comments(doc)
    doc.search('.comment > font:first-child').map { |font| font.inner_text}
  end

  ## takes nokogiri doc and returns an array of usernames (associated with comments)
  def self.usernames(doc)
    doc.search('.comhead > a:first-child').map do |element|
      element.inner_text
    end
  end

end