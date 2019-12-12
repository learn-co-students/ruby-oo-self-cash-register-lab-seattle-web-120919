
require 'pry'
class CashRegister
    def initialize(discount=0)
        @total = 0
        @discount = discount
        @items = []
        @last_item_price = 0

    end 
    attr_accessor :total, :discount, :last_item_price
    attr_reader :items

    def add_item(title, price, quantity=1)
        price *= quantity
        @last_item_price = price
        @total += price
        #binding.pry
        while(quantity > 0)
            @items.push(title)
            quantity -= 1
        end 
    end 

    def apply_discount
        
        if(discount == 0)
            return "There is no discount to apply."
        end
        self.total = (self.total - self.total*(self.discount.to_f/100)).to_i
        "After the discount, the total comes to $#{self.total}."
    end 

    def void_last_transaction
        @total -= @last_item_price
        if(total <= 0)
            @total = 0.0
            
        end 
    end 
end 