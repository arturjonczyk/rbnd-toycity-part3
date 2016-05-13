class Product
    attr_reader :title, :price, :stock

    @@products = []

    def initialize(options = {})
        @title = options[:title]
        @price = options[:price]
        @stock = options[:stock]

        add_to_products
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
        @@products.find_all(&:in_stock?)
    end

    # returns true if the stock product is bigger than 0
    def in_stock?
        @stock > 0
    end

    def depletes_stock
        if @stock > 0
            @stock -= 1
        else
            raise OutOfStockError, "#{@title} is out of stock."
        end
    end

    def add_stock
        @stock += 1
    end

    private

    def add_to_products
        # if true this will throw an error: "some product title" already exists.
        if @@products.map(&:title).include? @title
            raise DuplicateProductError, "#{@title} already exists."
        else
            @@products << self
        end
    end
end
