class StocksInfo::Scraper

    def self.scrape(ticker)
        ticker.html = Nokogiri::HTML(open("#{ticker.url}"))
        ticker.name = ticker.html.css("#quote-header-info h1").text
        ticker.price = ticker.html.css("#quote-header-info span")[1].text
        ticker.price_change = ticker.html.css("#quote-header-info span")[2].text
        ticker.news = ticker.html.css("#quoteNewsStream-0-Stream a")
    end

    def self.scrape_trending
        html = Nokogiri::HTML(open(StocksInfo::Stocktwits.trending_url))
        all_trending = html.text.scan(/symbol":"\w\w.../)
        all_trending[0..5].each do |symbol|
            StocksInfo::Stocktwits.trending_tickers << symbol.delete!("symbol\":,")
        end
    end

end
