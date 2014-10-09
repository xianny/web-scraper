require_relative 'scrape'

class InvalidInputError < StandardError
end

## CLI expected to run OR just crash/throw error 
input = ARGV[0]
# check for input
if input
  Scrape.new(input)
else
  raise InvalidInputError, "Don't have parser for that yet"
end
