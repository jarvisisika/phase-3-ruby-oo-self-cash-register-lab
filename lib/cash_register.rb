class CashRegister
    attr_reader :discount
  
    def initialize(employee_discount = 0)
      @discount = employee_discount
      @total = 0
      @items = []
    end
  
    def total=(value)
        @total = value
    end
      
  
    def total
      @total
    end
  
    def add_item(item, price, quantity = 1)
        item_details = { name: item, price: price, quantity: quantity }
        @total += price * quantity
      quantity.times { @items << item_details }
    end
  
    def apply_discount
      if @discount > 0
        @total -= (@total * @discount / 100)
        "After the discount, the total comes to $#{@total}."
      else
        "There is no discount to apply."
      end
    end
  
    def items
      @items.map { |item| item[:name] }
    end
  
    def void_last_transaction
        if @items.empty?
          @total = 0.0
        else
          last_item = @items.pop
          last_item_price = last_item[:price]
          last_item_quantity = last_item[:quantity] || 1
          @total -= last_item_price * last_item_quantity
        end
      end      
  end
  
