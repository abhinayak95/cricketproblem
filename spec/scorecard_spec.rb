require_relative '../scorecard.rb'

RSpec.describe Scorecard, '#increase_score' do
  context 'given a run' do
    it 'should be able to add that to toal match runs' do
      scorecard = Scorecard.new(24, 10, 3)
      scorecard.increase_score(4)
      scorecard.increase_score(4)
      scorecard.increase_score(4)
      result = scorecard.get_runs_scored()
      expect(result).to eq (12)
    end
  end
end

RSpec.describe Scorecard, '#increase_score' do
  context 'given no runs ie, no arguments' do
    it 'throws an ArgumentError' do
      scorecard = Scorecard.new(24, 10, 3)
      scorecard.increase_score(4)
      scorecard.increase_score(4)
      expect {
        scorecard.increase_score()
      }.to raise_error(ArgumentError)
    end
  end
end

RSpec.describe Scorecard, '#increase_score' do
  context 'calling get_remaining_wickets' do
    it 'returns the number of wickets_remaining' do
      scorecard = Scorecard.new(24, 10, 3)
      expect(scorecard.get_remaining_wickets()).to eq 3
    end
  end
end
