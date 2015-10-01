require 'pricing_ruleset'

describe PricingRuleSet do
  
  context '#calculate without rules' do
    before do
      allow(subject).to receive(:sku_prices) { [] }
    end
    
    it 'returns 0 for an empty rules list' do
      expect(subject.calculate([])).to eq(0)
    end
  end
  
  context '#calculate with rules' do
    let(:items) { ['A', 'B', 'C'] }
    let(:rule) { double('rule') }
    
    before do
      allow(subject).to receive(:sku_prices) { [rule, rule] }
    end
    
    it 'apply each of the pricing rules, passing the items list' do
      expect(rule).to receive(:apply).twice.with(items).and_return(0)
      subject.calculate(items)
    end
  end

end
