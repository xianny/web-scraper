require_relative 'scrape'

class InvalidInputError < StandardError

end

input = ARGV[0]

begin
  if input =~ /^https\:\/\/news\.ycombinator\.com/
    Scrape.new(input)
  else
    raise InvalidInputError, "HN Scraper only takes URLs beginning with https://news.ycombinator.com/"
  end
rescue
  puts "This is HACKER NEWS SCRAPER! Not random stuff scraper!"
  puts "Please enter Hacker News URL in the following format: https://news.ycombinator.com/item?id=xxxxxxx"
  input = STDIN.gets.chomp
  retry
end