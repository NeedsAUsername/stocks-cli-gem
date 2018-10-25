class StocksInfo::CLI

    def start
        show_indices
        show_trending
        menu
    end

    def show_indices
        puts "Here is how the market is doing today"
        {"S&P500": "%5EGSPC", "DOW JONES": "%5EDJI", "NASDAQ": "%5EIXIC"}.each do |name, ticker|
            index = StocksInfo::Ticker.new(ticker)
            StocksInfo::Scraper.scrape(index)
            puts "#{name}: #{index.price}, #{index.price_change}"
        end
    end

    def show_trending
        message = "Trending on Stocktwits:"
        StocksInfo::Scraper.scrape_trending
        StocksInfo::Stocktwits.trending_tickers.each do |ticker|
            message += " #{ticker}"
        end
        puts message
    end

    def menu
        puts "What ticker would you like info or price on?"
        input = nil
        while input != "exit"
            puts "Type ticker-news for latest news, ticker-price for price info, ticker-twits to open stocktwits page, or exit to exit. Ex: aapl-price"
            input = gets.strip
            if input == "exit"
              puts "Exiting"
            elsif !StocksInfo::Ticker.valid_ticker?("#{input.gsub("-news", "").gsub("-price", "").gsub("-twits", "")}")
                puts "That is not a valid ticker."
            elsif input.end_with?("-news")
                show_news(StocksInfo::Ticker.new(input.gsub("-news", "")))
            elsif input.end_with?("-price")
                show_price(StocksInfo::Ticker.new(input.gsub("-price", "")))
            elsif input.end_with?("-twits")
                open_twits(input.gsub("-twits", ""))
            else
                puts "Try again."
            end
        end
    end

    def show_news(ticker)
        StocksInfo::Scraper.scrape(ticker)
        puts "Latest News for #{ticker.name}:"
        ticker.news.each_with_index do |title, index|
            puts "#{index + 1}. #{title.text}"
            ticker.links << title.attribute("href").value
        end
        puts "Do you want to view any of these articles? Type its number or else type no"
        input = nil
        while input != "no"
            input= gets.strip
            if input == "no"
                puts "exiting to main menu"
            elsif input.to_i <= ticker.links.length && input.to_i > 0 #strings will convert to 0
                system("open https://finance.yahoo.com#{ticker.links[input.to_i - 1]}")
            else puts "That is not a valid article."
            end
        end
        ticker.links.clear
    end

    def show_price(ticker)
        StocksInfo::Scraper.scrape(ticker)
        puts ticker.name
        puts ticker.price
        puts ticker.price_change
    end

    def open_twits(ticker)
        system("open #{StocksInfo::Stocktwits.new(ticker).url}")
    end

end
