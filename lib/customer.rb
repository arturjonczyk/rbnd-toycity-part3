class Customer
    attr_reader :name
    @@customers = []

    def initialize(params)
        @name = params[:name]

        if @@customers.map { |customer| customer.name}.include? @name
            raise DuplicateProductError, "#{@name} already exists."
        else
            @@customers << self
        end
    end

    # returns all instances of customers
    def self.all
        @@customers
    end

    # returns the searched customer
    def self.find_by_name(name)
        @@customers.find { |product| product.name == name }
    end
end
