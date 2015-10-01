class CheckoutService
  
  attr_accessor :pricing_ruleset, :scanned_items
  
  def initialize(pricing_ruleset:)
    @pricing_ruleset = pricing_ruleset
    @scanned_items = []
  end
  
  def init_checkout
    @scanned_items = []
  end
  
  def scan item
    @scanned_items << item
  end
  
  def calculate_total
    pricing_ruleset.calculate(@scanned_items)
  end

end
