This is a simple [Hacker News](https://news.ycombinator.com/) web scraper. To run, download the project and run the following commands from the project directory:

    $ bundle install
    $ ruby web_scraper.rb post.html

I made this scraper in week 2 of the Lighthouse Labs web development bootcamp to practice using the Nokogiri gem. 

The parser is decoupled to theoretically allow for switching in different parsers, depending on input URL. Currently there only exists a Hacker News module, but it would be easy enough to add different modules to handle different sites.