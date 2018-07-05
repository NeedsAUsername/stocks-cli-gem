class Stocks::Ticker

    attr_accessor :name, :price, :price_change, :summary

    def initialize
        @name = "Apple(aapl)"
        @price = "184.96"
        @price_change = "+.58%"
        @summary = "Apple company's summary"
    end

    def show_info
        puts self.name
        puts self.price
        puts self.price_change
        puts self.summary
    end

    def show_price
        puts self.name
        puts self.price
        puts self.price_change
    end 

end
