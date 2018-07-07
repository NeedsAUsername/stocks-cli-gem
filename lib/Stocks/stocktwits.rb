class Stocks::Stocktwits

    attr_accessor :url

    def initialize(ticker)
        @url = "https://stocktwits.com/symbol/#{ticker}"
    end

    def self.show_trending
        # can't pull trending off of stocktwits website, so scraping an api
        html = Nokogiri::HTML(open("https://api.stocktwits.com/api/2/trending/symbols.json"))
        symbols = html.text.scan(/symbol":"\w\w.../)
        puts "Trending on Stocktwits:"
        puts symbols
        # fix later to get just the tickers, and have them listed on one line
    end

    def show_comments
        puts "comments here"
    end

end
