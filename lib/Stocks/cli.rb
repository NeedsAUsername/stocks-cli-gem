
class Stocks::CLI

    def call
        show_indices
        show_trending
        menu
    end

    def show_indices
        Stocks::Indices.new.market_info
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
        Stocks::Ticker.new.show_info
    end

    def show_price
        # puts "ticker price"
        Stocks::Ticker.new.show_price
    end

end
