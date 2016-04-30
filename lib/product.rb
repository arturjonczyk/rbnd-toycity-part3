class Product
    attr_reader :title, :price, :stock

    @@products = []

    def initialize(params)
        @title = params[:title]
        @price = params[:price]
        @stock = params[:stock]

        if @@products.map { |product| product.title}.include? @title
            raise DuplicateProductError, "#{@title} already exists."
        else
            @@products << self
        end

    end

    # returns all instances of products
    def self.all
        @@products
    end

    # returns the searched product
    def self.find_by_title(title)
        @@products.find { |product| product.title == title }
    end

    # returns an array of all products with a stock greater than zero
    def self.in_stock
        @@products.find_all { |product| product.in_stock? }
    end

    # returns true if the stock product is bigger than 0
    def in_stock?
        @stock > 0
    end
end
