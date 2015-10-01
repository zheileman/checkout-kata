class PriceRule
  
  attr_accessor :sku, :unit_price, :bulk_amount, :bulk_unit_price
  
  def initialize(sku, unit_price, bulk_amount = nil, bulk_unit_price = nil)
    @sku = sku
    @unit_price = unit_price
    @bulk_amount = bulk_amount
    @bulk_unit_price = bulk_unit_price
  end
  
  def apply items
    found_items = items.select { |item| item == @sku }.size
    
    return 0 if found_items.zero?
    
    if special_pricing?
      bulk_items = (found_items / @bulk_amount)
      non_bulk_items = (found_items % @bulk_amount)
      (bulk_items * @bulk_unit_price) + (non_bulk_items * @unit_price)
    else
      found_items * @unit_price
    end
  end
  
  
  private
  
  def special_pricing?
    @bulk_amount && @bulk_unit_price
  end
  
end
