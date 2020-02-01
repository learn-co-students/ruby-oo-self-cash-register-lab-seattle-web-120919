require 'pry'

class CashRegister
 
    attr_accessor :total, :discount, :items
   
    def initialize(discount=0.0)
      @total = 0.0 
      @discount = discount
      @items = []
      @last_price = 0.0
    end 
   
    def add_item(title, price, quantity=1)
        @last_price = 0
        # While there is more than one item of this type
        while quantity > 0 do
            # Add the price to the total
            @total += price

            # Set the last_price variable to the price for use later
            @last_price += price

            # Decrease the quantity 
            quantity -= 1

            # Add the item to the list of items
            @items.push(title)
            
        end
    end

    def apply_discount
        if(@discount == 0.0) 
           return "There is no discount to apply."
        else
            @total = @total - (@total * (@discount/100.0))
            return "After the discount, the total comes to $#{@total.to_i}."
        end
    end

    def void_last_transaction 
        # Remove the last item from the array
        @items.pop
        # returns the total to 0.0 if all items have been removed
        if (@items.length == 0) 
            @total = 0.0
        else
            # Update total
            @total = @total - @last_price 
        end
        return @total
    end
  end