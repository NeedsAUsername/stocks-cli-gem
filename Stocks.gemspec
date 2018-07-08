require_relative './lib/stocks-info/version'

Gem::Specification.new do |s|
    s.name = "stocks-info"
    s.version = StocksInfo::VERSION
    s.summary = "Stocks Information"
    s.description = "Gives yahoo finance news headlines, prices, and trending StockTwits."
    s.authors = ["Kevin Chi"]
    s.email = "kevinchi118@gmail.com"
    s.files = ["lib/stocks-info.rb", "lib/stocks-info/cli.rb"]
    s.homepage = "http://rubygems.org/gems/stocks-info"
    s.executables << "stocks-info"

    s.add_development_dependency "bundler", "~> 1.16"
    s.add_development_dependency "rake", "~> 10.0"

    s.add_development_dependency "nokogiri"
end
