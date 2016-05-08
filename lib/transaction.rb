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

    # deleting transaction and updating stock
    def self.delete_transaction(transaction)
        @@transactions.delete_if {|t| t.id == transaction.id}
        transaction.product.stock += 1
    end
end
