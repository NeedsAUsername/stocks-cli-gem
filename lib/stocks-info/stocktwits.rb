class StocksInfo::Stocktwits

    attr_accessor :url

    def initialize(ticker)
        @url = "https://stocktwits.com/symbol/#{ticker}"
        @trending_url = "https://api.stocktwits.com/api/2/trending/symbols.json"
        @trending_tickers = []
    end

    @@trending_url = "https://api.stocktwits.com/api/2/trending/symbols.json" #api page with trending data
    @@trending_tickers = []

    def self.trending_url
        @@trending_url
    end

    def self.trending_tickers
        @@trending_tickers
    end
end
