class Stocks::Ticker

    attr_accessor :html, :name, :price, :price_change, :info 

    def initialize #add symbol as parameter later
        @html = Nokogiri::HTML(open("https://finance.yahoo.com/quote/%5EGSPC"))
        #later make url change with symbol
    end

    def scrape
        self.name = self.html.css("#quote-header-info h1").text
        self.price = self.html.css("#quote-header-info span")[1].text
        self.price_change = self.html.css("#quote-header-info span")[2].text
        self.info = self.html.css("#quote-summary div")[1].text
    end

    def show_info
        scrape
        puts self.name
        puts self.price
        puts self.price_change
        puts self.info
    end

    def show_price
        scrape
        puts self.name
        puts self.price
        puts self.price_change
    end

end
