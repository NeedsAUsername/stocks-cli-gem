class Stocks::Indices

    attr_accessor :sp500, :dow, :nasdaq, :sp500_url, :dow_url, :nasdaq_url

    def initialize
        @sp500_url = "%5EGSPC"
        @dow_url = "%5EDJI"
        @nasdaq_url = "%5EIXIC"
    end

    def scraper
        self.sp500 = Stocks::Ticker.new(self.sp500_url)
        self.sp500.scrape
        self.dow = Stocks::Ticker.new(self.dow_url)
        self.dow.scrape
        self.nasdaq = Stocks::Ticker.new(self.nasdaq_url)
        self.nasdaq.scrape
    end

    def market_info
        self.scraper
        puts "S&P500: #{self.sp500.price}, #{self.sp500.price_change}"
        puts "DOW JONES: #{self.dow.price}, #{self.sp500.price_change}"
        puts "NASDAQ: #{self.nasdaq.price}, #{self.sp500.price_change}"
    end


end
