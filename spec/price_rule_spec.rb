require 'price_rule'

describe PriceRule do

  let(:items) { ['A', 'B', 'A', 'A', 'C', 'A', 'C'] }

  context 'apply rule when there is a special pricing' do
    subject { described_class.new('A', 50, 3, 130) }
    
    it 'returns the total price for all items meeting this price rule' do
      expect(subject.apply(items)).to eq(180)
    end
  end
  
  context 'apply rule when there is not a special pricing' do
    subject { described_class.new('C', 20) }
    
    it 'returns the total price for all items meeting this price rule' do
      expect(subject.apply(items)).to eq(40)
    end
  end

end
