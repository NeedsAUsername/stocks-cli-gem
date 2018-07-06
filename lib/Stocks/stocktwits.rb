class Stocks::Stocktwits

    attr_accessor :url

    def initialize(ticker)
        @url = "https://stocktwits.com/symbol/#{ticker}"
    end

    def self.show_trending
        puts "Trending on StockTwits: Apple(AAPL), Nividia(NVDA), Amazon(AMZN)"
    end

    def show_comments
        puts "comments here"
    end

end
