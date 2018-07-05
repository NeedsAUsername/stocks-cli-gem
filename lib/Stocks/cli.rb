
class Stocks::CLI

    def call
        show_indices
        show_trending
        menu
    end

    def show_indices
        puts "Here is how the market is doing today"
        market = Stocks::Indices.new
        market.market_info 
        # puts <<-DOC.gsub /^\s*/, ''
        #     1. SPY - 2713.22
        #     2. DOW - 24,174.82
        #     3. NASDAQ - 7,502.67
        # DOC
    end

    def show_trending
    end

    def menu
        puts "What ticker would you like info or price on?"
        input = nil
        while input != "exit"
            puts "Type ticker-info for detailed info, and type ticker-price for current price, and type exit to exit."
            input = gets.strip
            if input.end_with?("info")
                show_info
            elsif input.end_with?("price")
                show_price
            elsif input == "exit"
                puts "Exiting"
            else
                puts "Try again."
            end
        end
    end

    def show_info
        # puts "ticker info"
        ticker = Stocks::Ticker.new
        puts "your info on #{ticker.symbol}"
        puts "#{ticker.price}"
        puts "#{ticker.price_change}"
        puts "#{ticker.summary}"
    end

    def show_price
        # puts "ticker price"
        ticker = Stocks::Ticker.new
        puts "#{ticker.symbol}"
        puts "#{ticker.price}"
        puts "#{ticker.price_change}"
    end

end
