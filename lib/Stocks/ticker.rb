class Stocks::Ticker

    attr_accessor :url, :html, :name, :price, :price_change, :info

    def initialize(ticker) #add symbol as parameter later
        @url = "https://finance.yahoo.com/quote/#{ticker.upcase}"
        #later make url change with symbol
    end

    def scrape
        self.html = Nokogiri::HTML(open("#{self.url}"))
        self.name = self.html.css("#quote-header-info h1").text
        self.price = self.html.css("#quote-header-info span")[1].text
        self.price_change = self.html.css("#quote-header-info span")[2].text
        self.info = self.html.css("#quote-summary div")[1].text
    end

    def show_info
        self.scrape
        puts self.name
        puts self.price
        puts self.price_change
        puts self.info
    end

    def show_price
        self.scrape
        puts self.name
        puts self.price
        puts self.price_change
    end

end
