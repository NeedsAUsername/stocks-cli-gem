class Stocks::Ticker

    attr_accessor :url, :html, :name, :price, :price_change, :news, :links

    def initialize(ticker)
        @url = "https://finance.yahoo.com/quote/#{ticker.upcase}"
        @links = []
        @number_of_articles = 0
    end

    def scrape
        self.html = Nokogiri::HTML(open("#{self.url}"))
        self.name = self.html.css("#quote-header-info h1").text
        self.price = self.html.css("#quote-header-info span")[1].text
        self.price_change = self.html.css("#quote-header-info span")[2].text
        self.news = self.html.css("#quoteNewsStream-0-Stream a")
    end

    def show_news
        self.scrape
        puts "Latest News for #{self.name}:"
        self.news.each_with_index do |title, index|
            puts "#{index + 1}. #{title.text}"
            self.links << title.attribute("href").value
        end
        self.view_news
    end

    def view_news
        puts "Do you want to view any of these articles? Type its number or else type no"
        input = nil
        while input != "no"
            input= gets.strip
            if input == "no"
                puts "exiting to main menu"
            elsif input.to_i <= self.links.length && input.to_i > 0 #strings will convert to 0
                system("open https://finance.yahoo.com#{self.links[input.to_i - 1]}")
            else puts "That is not a valid article."
            end
        end
        self.links.clear
    end


    def show_price
        self.scrape
        puts self.name
        puts self.price
        puts self.price_change
    end

    def self.test
        puts "test"
    end

end
