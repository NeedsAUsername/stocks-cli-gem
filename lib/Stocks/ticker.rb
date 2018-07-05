class Stocks::Ticker

    attr_reader :symbol, :price, :price_change, :summary,

    def symbol
        "aapl"
    end

    def price
        "185.39"
    end

    def price_change
        "+.81%"
    end

    def summary
        "Apple Inc. designs, manufactures, and markets mobile communication and media devices, and personal computers to consumers, and small and mid-sized businesses."
    end
    
end
