require 'pry'

class CashRegister

    attr_reader :discount, :total
    attr_writer :total
    attr_accessor :items

    def initialize(discount=0.0)
        @total = 0
        @discount = discount
        @items = []
    end 

    def add_item(title, price, quantity=1)

        quantity.times do 
            @items << title 
        end  
        @total = @total + (price * quantity)
         @last_item_price = price
         @last_quantity_item = quantity
         @items
end 

    def apply_discount
    @total -= @total * @discount.to_f/100
    if discount == 0
    "There is no discount to apply."
    else 
    "After the discount, the total comes to $#{@total.to_i}."
    end 
end 


def items
    @items 
end 

def void_last_transaction
    #binding.pry
@total -= (@last_item_price*@last_quantity_item)

if @items.length <= 0
    @total = 0.0


end 

    

  

end 
end 