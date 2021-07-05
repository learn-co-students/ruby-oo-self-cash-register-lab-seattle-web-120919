require "pry"

class CashRegister
  attr_accessor :total, :discount, :price, :cart, :last_item, :last_quantity

  def initialize(discount = 0)
    self.total = 0
    self.discount = discount
    self.cart = []
  end

  # adds the given item(s) price to the total
  # need to count through the qunaity in order to place multiples of
  # the same item in the cart
  def add_item(item, price, quantity = 1)
    self.total += price * quantity
    self.last_item = price
    self.last_quantity = quantity

    counter = 0
    while counter < quantity
      self.cart << item
      counter += 1
    end
    self.cart
  end

  # apply the discount(20) to the total of the purchases
  def apply_discount
    if self.discount > 0
      self.total = @total - @total * @discount / 100
      return "After the discount, the total comes to $#{@total}."
    else
      return "There is no discount to apply."
    end
  end

  def items
    self.cart
  end

  # in order for us to use remove the last item price we are going to need to referance
  # add_item and access its price. Set a new instance variable (last_time) so our void method can access it.
  # set the last_item to the price of the item then set a new variable
  # we will need to multiply the last transactions quanity as well.
  def void_last_transaction
    self.total -= self.last_item * self.last_quantity
    self.cart.pop
    if self.cart.length <= 0
      self.total = 0.0
    end
    # binding.pry
  end
end
