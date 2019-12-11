class CashRegister
    attr_accessor :discount, :total, :last_transaction

    def initialize(discount = 0)
        @@items = []
        @total = 0
        @discount = discount
    end

    def add_item(item, price, quantity = 1)
        @total += price * quantity
        @@items.fill(item, @@items.length, quantity)
        @last_transaction = price * quantity
    end

    def apply_discount
        if @discount > 0
            @total -= @total * @discount/100
            return "After the discount, the total comes to $#{@total}."
        end
        "There is no discount to apply."
    end

    def items
        @@items
    end

    def void_last_transaction
        @total -= @last_transaction
    end
end
