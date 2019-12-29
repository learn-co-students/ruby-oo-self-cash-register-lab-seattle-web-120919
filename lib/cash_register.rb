require 'pry'
class CashRegister

    attr_accessor :total, :discount, :items, :last_item

    def initialize(employee_disc = 0)
        self.total = 0
        self.discount = employee_disc
        self.items = []
    end

    def add_item(item, price, quantity = 1)
        self.total += price * quantity
        self.last_item = price * quantity
        quantity.times do
            items << item
        end
        # self.void_last_transaction_amount = price * quantity
    end

    def apply_discount
        if discount != 0
            discounted_total = self.total = total - discount * 10
            return "After the discount, the total comes to $#{discounted_total}."
        else
            return "There is no discount to apply."
        end
    end

    def void_last_transaction
        self.total -= self.last_item
    end

end























# class CashRegister

#     attr_accessor :discount, :total, :all, :last_price
#     # @@all =[]

#     def initialize(employee_disc = 0)
#         @total = 0
#         @discount = employee_disc
#         @all = []
#         @last_price = 0
#     end

#     def add_item(title, price, quant = 1)
#         quant.times do 
#         @all << title
#         end
#         @last_price = price * quant
#         @total += price * quant
#     end

#     def apply_discount
#         if @discount == 0
#            return "There is no discount to apply."
#         end
#         @total -= (@discount.to_f/100)*(@total)
        
#         return "After the discount, the total comes to $#{@total.to_i}."
#     end

#     def items
#         @all
#     end

#     def void_last_transaction
#         @total -= @last_price
#     end

# end