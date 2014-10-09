require 'nokogiri'
require 'open-uri'
require_relative 'hacker_news/hacker_news'

class Scrape
  attr_accessor :url, :doc

  class MissingParserError < StandardError ## I haven't made the appropriate extractor
  end

  ## takes filepath of file to be parsed
  def initialize(url)
    @url = url
    parse_file
  end

  # ## TODO returns appropriate parser class depending on url
  def parser_class
    case @url
    when @url then HackerNews::Parser
    # when @url =~ /.*reddit.*/i then require './reddit/parser'
    else
      raise MissingParserError
    end
  end

  ## converts file and runs appropriate parser
  def parse_file
    doc = Nokogiri::HTML(open(url))
    parser = parser_class.run(doc)
  end


end

