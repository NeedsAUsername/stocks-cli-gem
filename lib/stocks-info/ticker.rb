class StocksInfo::Ticker

    attr_accessor :url, :html, :name, :price, :price_change, :news, :links

    def initialize(ticker)
        @url = "https://finance.yahoo.com/quote/#{ticker.upcase}"
        @links = []
    end

    def self.valid_ticker?(ticker)
        html = Nokogiri::HTML(open(self.new(ticker).url))
        if html.css("#quote-header-info h1").text == ""
            false
        else true
        end
    end
end
