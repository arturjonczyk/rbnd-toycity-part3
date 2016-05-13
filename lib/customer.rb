class Customer
    attr_reader :name
    @@customers = []

    def initialize(options = {})
        @name = options[:name]
        add_to_customers
    end

    # returns all instances of customers
    def self.all
        @@customers
    end

    # returns the searched customer
    def self.find_by_name(name)
        @@customers.find { |product| product.name == name }
    end

    # purchase product by customer
    def purchase(product)
        Transaction.new(self, product)
    end

    # returning all transactions done by customer
    def all_transactions
        Transaction.all.select { |t| t.customer.name == @name }
    end

    def display_all_transactions
        all_transactions.each do |t|
            puts "Transaction ID: #{t.id} - #{t.product.title}"
        end
    end

    # returning product by customer
    def return(product)
        # returning correct transaction
        transaction = all_transactions.select { |t| t.product == product }.last

        # deleting transaction from Transactions
        Transaction.delete_transaction(transaction)
    end

    private

    def add_to_customers
        if @@customers.map(&:name).include? @name
            raise DuplicateCustomerError, "#{@name} already exists."
        else
            @@customers << self
        end
    end
end
