require 'pry'

class CashRegister
    attr_reader :discount
    attr_accessor :total, :add_item, :items, :last_item_price

    def initialize(discount=0)
        @total = 0
        @discount = discount 
        @items = []
        @last_item_price
    end 

    def total
        @total
    end

    def add_item(title, price, quantity=1)
        @total = @total + (price * quantity)
        @last_quantity_item = quantity 
        @last_item_price = price 
        quantity.times do 
            @items << title 
        end  
        @items 
    end

    def apply_discount
        @total = @total * (1- (discount.to_f/100)) 
        if @discount == 0
        "There is no discount to apply."
        else 
        "After the discount, the total comes to $#{@total.to_i}."
        end 
    end 

    def items
        @items
    end

    def void_last_transaction
# remove the last transaction from the total. You'll need to make an additional 
# attribute accessor and keep track of that last transaction amount somehow. 
# In what method of the class are you working with an individual item?
        @total -= (@last_item_price * @last_quantity_item)
        @items.pop
        if @items.length <= 0 
           @total = 0.0
        end 
    end 
end


