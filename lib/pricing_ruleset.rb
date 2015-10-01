require 'price_rule'

class PricingRuleSet

  # For the purpose of this kata, this ruleset will be in-memory and the data will be hardcoded.
  # In a real world, a datasource should be in charge of retrieving/caching/updating the list of rules 
  # through some other external service or a persistent database.

  # Item  Unit Price  Special Price
  # -------------------------------
  # A     50          3 for 130
  # B     30          2 for 45
  # C     20          -
  # D     15          -

  SKU_PRICES ||= [
    PriceRule.new('A', 50, 3, 130),
    PriceRule.new('B', 30, 2, 45),
    PriceRule.new('C', 20),
    PriceRule.new('D', 15)
  ]
  
  def sku_prices; SKU_PRICES; end

  def calculate items
    sku_prices.inject(0) { |result, rule| result += rule.apply(items) }
  end

end
