
class Stocks::CLI
    attr_accessor :info

    def call
        show_indices
        show_trending
        menu
    end

    def show_indices
        Stocks::Indices.new.market_info
    end

    def show_trending
        Stocks::Stocktwits.show_trending
    end

    def menu
        puts "What ticker would you like info or price on?"
        input = nil
        while input != "exit"
            puts "Type ticker-info for detailed info, ticker-price for price info, ticker-comments for stocktwits feed, or exit to exit."
            input = gets.strip
            if input.end_with?("-info")
                show_info(input.gsub("-info", ""))
            elsif input.end_with?("-price")
                show_price(input.gsub("-price", ""))
            elsif input.end_with?("-feed")
                show_comments(input.gsub("-feed", ""))
            elsif input == "exit"
                puts "Exiting"
            else
                puts "Try again."
            end
        end
    end

    def show_info(ticker)
        Stocks::Ticker.new(ticker).show_info
    end

    def show_price(ticker)
        Stocks::Ticker.new(ticker).show_price
    end

    def show_comments(ticker)
        Stocks::Stocktwits.new(ticker).show_comments
    end


end
