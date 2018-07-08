
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
            puts "Type ticker-news for latest news, ticker-price for price info, ticker-twits to open stocktwits page, or exit to exit."
            input = gets.strip
            if input.end_with?("-news")
                show_news(input.gsub("-news", ""))
            elsif input.end_with?("-price")
                show_price(input.gsub("-price", ""))
            elsif input.end_with?("-twits")
                open_twits(input.gsub("-twits", ""))
            elsif input == "exit"
                puts "Exiting"
            else
                puts "Try again."
            end
        end
    end

    def show_news(ticker)
        Stocks::Ticker.new(ticker).show_news
    end

    def show_price(ticker)
        Stocks::Ticker.new(ticker).show_price
    end

    def open_twits(ticker)
        Stocks::Stocktwits.new(ticker).open_twits
    end


end
