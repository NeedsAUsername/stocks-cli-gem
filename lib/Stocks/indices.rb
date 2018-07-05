class Stocks::Indices

    attr_accessor :sp500, :dow, :nasdaq

    def initialize
        @sp500 = "S&P500: 2717.11"
        @dow = "Dow: 24188.31"
        @nasdaq = "Nasdaq: 7513.84"
    end

    def market_info
        puts "Here is how the market is doing today"
        puts self.sp500
        puts self.dow
        puts self.nasdaq
    end
end
