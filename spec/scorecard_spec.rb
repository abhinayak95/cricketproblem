require_relative '../scorecard.rb'

RSpec.describe Scorecard, '#' do
  context 'Given an intial values' do
    it 'ok' do
      scorecard = Scorecard.new(24, 10)
    end
  end
end
