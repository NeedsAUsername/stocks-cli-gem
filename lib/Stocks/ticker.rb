class Stocks::Ticker

    attr_accessor :html, :name, :price, :price_change, :summary

    def initialize #add symbol as parameter later
        @html = Nokogiri::HTML(open("https://finance.yahoo.com/quote/%5EGSPC"))
        #later make url change with symbol
    end

    def scrape
        self.name = "name"
        self.price = self.html.css("#quote-header-info span")[1].text
        self.price_change = self.html.css("#quote-header-info span")[2].text
        self.summary = "summary"
    end

    def show_info
        scrape
        puts self.name
        puts self.price
        puts self.price_change
        puts self.summary
    end

    def show_price
        scrape
        puts self.name
        puts self.price
        puts self.price_change
    end

end
