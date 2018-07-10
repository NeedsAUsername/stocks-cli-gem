class StocksInfo::Ticker

    attr_accessor :url, :html, :name, :price, :price_change, :news, :links

    def initialize(ticker)
        @url = "https://finance.yahoo.com/quote/#{ticker.upcase}"
        @links = []
    end
end
