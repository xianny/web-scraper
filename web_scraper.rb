require './config'


## CLI expected to run OR just crash/throw error 
ARGV[0] ? Scraper.run(ARGV[0]) : Manual.run
