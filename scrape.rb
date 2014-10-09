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
    @doc = Nokogiri::HTML(open(url))
    @page = parsed_file(@doc)
    display_file
  end

  ## converts file and runs appropriate parser
  def parsed_file(doc)
    parser = parser_class.new
    parser.run(doc)
  end

  ## display file
  def display_file
    display = display_class.new
    display.run(@page)
  end

    # ## TODO returns appropriate parser class depending on url
  def parser_class
    case @url
    when @url then HackerNews::Parser
    # when @url =~ /.*reddit.*/i then HackerNews::Reddit
    else
      raise MissingParserError
    end
  end

  ## TODO see parser_class
  def display_class
    case @url
    when @url then HackerNews::CommandLineDisplay
    else
      raise MissingParserError
    end
  end

end

