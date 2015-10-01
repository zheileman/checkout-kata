require 'pricing_ruleset'
require 'checkout_service'

describe 'CheckoutServiceIntegration' do

  let(:pricing_ruleset) { PricingRuleSet.new }
  
  subject { CheckoutService.new(pricing_ruleset: pricing_ruleset) }
  
  describe '#calculate_total' do

    # Item  Unit Price  Special Price
    # -------------------------------
    # A     50          3 for 130
    # B     30          2 for 45
    # C     20          -
    # D     15          -

    before do
      subject.init_checkout
      items.each { |item| subject.scan(item) }
    end

    context "buying 1xA" do
      let(:items) { ['A'] }

      it "returns a total price of 50" do
        expect(subject.calculate_total).to eq(50)
      end
    end
    
    context "buying 3xA" do
      let(:items) { ['A', 'A', 'A'] }

      it "returns a total price of 130" do
        expect(subject.calculate_total).to eq(130)
      end
    end
    
    context "buying 4xA" do
      let(:items) { ['A', 'A', 'A', 'A'] }

      it "returns a total price of 180" do
        expect(subject.calculate_total).to eq(180)
      end
    end
    
    context "buying 1xA, 1xB, 1xC, 1xD" do
      let(:items) { ['A', 'B', 'C', 'D'] }

      it "returns a total price of 115" do
        expect(subject.calculate_total).to eq(115)
      end
    end
    
    context "buying 3xA and 1xC in random order" do
      let(:items) { ['A', 'C', 'A', 'A'] }

      it "returns a total price of 150" do
        expect(subject.calculate_total).to eq(150)
      end
    end
    
    context "buying 3xA and 3xB in random order" do
      let(:items) { ['A', 'B', 'A', 'B', 'A', 'B'] }

      it "returns a total price of 205" do
        expect(subject.calculate_total).to eq(205)
      end
    end
  end
  
end
