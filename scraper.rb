class Scraper
  attr_accessor :url, :doc

  class MissingParserError < StandardError ## I haven't made the appropriate extractor
  end

  class << self
    ## takes filepath of file to be parsed
    def run(url)
      @url = url
      page = parse(Nokogiri::HTML(open(url)))
      display(page)
    end

    ## converts file and runs appropriate parser
    def parse(doc)
      parser = parser_class.new
      parser.run(doc)
    end

    ## display file
    def display(page)
      display = display_class.new
      display.run(page)
    end

      # ## TODO returns appropriate parser class depending on url
    def parser_class
      case @url
      when 'post.html' then HackerNews::Parser ## example case
      when @url then HackerNews::Parser
      # when @url =~ /.*reddit.*/ then HackerNews::Reddit
      else
        raise MissingParserError
      end
    end

    ## TODO see parser_class
    def display_class
      case @url
      when 'post.html' then HackerNews::CommandLineDisplay ## example case
      when @url then HackerNews::CommandLineDisplay
      else
        raise MissingParserError
      end
    end

  end

end

