## Overview ##

This is a simple [Hacker News](https://news.ycombinator.com/) web scraper. It's intended largely as a proof of concept, not a competitor to the many great web scraping gems that already exist. 

It takes a URL and outputs formatted information to the terminal. To try it out, download the project and run the following commands from the project directory:

    $ bundle install
    $ ruby web_scraper.rb post.html

The parsing and extracting functions specific to Hacker News are decoupled from the rest of the application in a separate module. This makes it relatively simple to extend the functionality of the app by adding different modules for different websites. The Scraper object selects which parser to use through a simple case statement and some regex magic. Display functions are similarly encapsulated in a Display class (in this case, CommandLineDisplay).