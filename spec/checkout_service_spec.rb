require 'checkout_service'

describe CheckoutService do
  
  let(:pricing_ruleset) { double('pricing_ruleset') }
  let(:item) { 'A' }

  subject { described_class.new(pricing_ruleset: pricing_ruleset) }

  context '#init_checkout' do
    it "clears the scanned items buffer and subtotal" do
      subject.scan(item)
      subject.init_checkout
      expect(subject.scanned_items).to be_empty
    end
  end
  
  context '#scan' do
    it "add the item to the scanned items buffer" do
      subject.scan(item)
      expect(subject.scanned_items).to include(item)
    end
  end
  
  context '#calculate_total' do
    let(:items) { ['A', 'B', 'A', 'A', 'B'] }
    
    before do
      items.each { |item| subject.scan(item) }
    end
    
    it "uses the pricing ruleset to calculate a given list of items" do
      expect(pricing_ruleset).to receive(:calculate).with(items)
      subject.calculate_total
    end
  end

end
