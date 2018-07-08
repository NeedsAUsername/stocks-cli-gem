class StocksInfo::Stocktwits

    attr_accessor :url

    def initialize(ticker)
        @url = "https://stocktwits.com/symbol/#{ticker}"
    end

    def self.show_trending
        # can't pull trending off of stocktwits website, so scraping an api
        html = Nokogiri::HTML(open("https://api.stocktwits.com/api/2/trending/symbols.json"))
        symbols = html.text.scan(/symbol":"\w\w.../)
        message = "Trending on Stocktwits:"
        symbols[0..5].each do |symbol|
            message +=  " #{symbol.delete("symbol\":,")}"
        end
        puts message
    end

    def open_twits
        system("open #{self.url}")
    end

end
