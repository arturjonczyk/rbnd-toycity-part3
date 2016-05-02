class Transaction
    attr_reader :id, :product, :customer

    @@id = 1
    @@transactions = []

    def initialize(customer, product)
        @customer = customer
        @product = product
        @product.stock -= 1
        @id = @@id
        @@id += 1
        @@transactions << self
    end

    # returns all instances of transactions
    def self.all
        @@transactions
    end

    # finding product by id
    def self.find(id)
        @@transactions.find { |product| product.id == id }
    end
end
