
class Stocks::CLI

    def call
        show_indices
        show_trending
        menu
    end

    def show_indices
        puts <<-DOC.gsub /^\s*/, ''
            1. SPY - 2713.22
            2. DOW - 24,174.82
            3. NASDAQ - 7,502.67
        DOC
    end

    def show_trending
    end

    def menu
    end

end
