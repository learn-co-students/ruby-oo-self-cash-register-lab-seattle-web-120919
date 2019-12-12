class CashRegister

    attr_accessor :discount, :total, :all, :last_price
    # @@all =[]

    def initialize(emp_disc = 0)
        @total = 0
        @discount = emp_disc
        @all = []
        @last_price = 0
    end

    def add_item(title, price, quant = 1)
        quant.times do 
        @all << title
        end
        @last_price = price * quant
        @total += price * quant
    end

    def apply_discount
        if @discount == 0
           return "There is no discount to apply."
        end
        @total -= (@discount.to_f/100)*(@total)
        return "After the discount, the total comes to $#{@total.to_i}."
    end

    def items
        @all
    end

    def void_last_transaction
        @total -= @last_price
    end

end