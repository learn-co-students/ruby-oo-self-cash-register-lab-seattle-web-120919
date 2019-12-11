require 'pry'

class CashRegister
    attr_accessor :total, :discount, :items, :transactionlist

    def initialize(discount = 0)
        @total = 0
        @discount = discount
        @items = []
        @transactionlist = []
    end

    def discount
        self.discount = @discount
    end

    def add_item(itemname, price, itemquantity = 1)
        self.total += (price * itemquantity)
        itemquantity.times do
        self.items.push(itemname)
        self.transactionlist.push(price * itemquantity)
        end 
    end

    def apply_discount
        if discount != 0
        self.total = (total - (total * (discount.to_f / 100.to_f)))
        "After the discount, the total comes to $#{self.total.to_i}." 
        else 
        "There is no discount to apply."
        end    
    end

    def void_last_transaction
        self.total = total - transactionlist.pop
    end
end
