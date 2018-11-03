require_relative '../weighted_random_generator.rb'

RSpec.describe 'RandomGenerator', '#random_weighted' do
  context 'Given a hash' do
    it 'returns random key based on the weight of the value' do
      random_generator = RandomGenerator.new()
      result = random_generator.random_weighted({'cat' => 100, 'dog' => 0})
      expect(result).to eq 'cat'
    end
  end
end

RSpec.describe 'RandomGenerator', '#random_weighted' do
  context 'Given a hash' do
    it 'returns either cat or dog but not mouse' do
      random_generator = RandomGenerator.new()
      result = random_generator.random_weighted({'cat' => 50, 'dog' => 50, 'mouse' => 0})
      expect(result).to eq('cat').or(eq('dog'))
    end
  end
end

RSpec.describe 'RandomGenerator', '#random_weighted' do
  context 'Given a hash' do
    it 'throws error if all the weights are zero' do
      random_generator = RandomGenerator.new()
      expect{
        result = random_generator.random_weighted({'cat' => 0, 'dog' => 0, 'mouse' => 0})
      }.to raise_error(NoMethodError)
    end
  end
end
