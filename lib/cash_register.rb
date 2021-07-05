require "pry"

class CashRegister
  attr_accessor :discount, :total, :title, :cart

  def initialize(discount = nil)
    @discount = discount
    @total = 0
    @cart = []
  end

  def add_item(title, price, quantity = 1) #know which items are going to be needing to be placed in. create variables to represent things.
    # binding.pry
    @total += (price * quantity)
    @last_item_price = price
    @last_item_quantity = quantity
    # @last_item_price = price #why does setting this here represent the price of the last item?
    counter = 0
    while counter < quantity
      @cart << title
      #binding.pry
      counter += 1
    end
    @cart
    #binding.pry
    #binding.pry
  end

  def apply_discount
    if discount
      @total -= (discount / 100.to_f) * @total
      return "After the discount, the total comes to $#{@total.to_i}."
    else
      return "There is no discount to apply."
    end
  end

  def items
    @cart
    #binding.pry
    #binding.pry
    #binding.pry
  end

  def void_last_transaction
    #binding.pry
    if @cart.length == 0
      @total = 0.0
    end
    @total -= (@last_item_price * @last_item_quantity)
    @cart.pop
    #binding.pry
  end
end
