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

RSpec.describe Scorecard, '#batsman_on_strike' do
  context 'calling the batsman_on_strike method' do
    it 'returns the Batsman object which is on strike' do
      scorecard = Scorecard.new(24, 10, 1)
      batsman1 = Batsman.new('Test1', Probability.new(5, 30, 25, 10, 15, 1, 9, 5))
      batsman2 = Batsman.new('Test2', Probability.new(10, 40, 20, 5, 10, 1, 4, 10))
      scorecard.batsmen_batting_order([batsman1, batsman2])
      expect(scorecard.batsman_on_strike().name).to eq("Test1")
    end
  end
end

RSpec.describe Scorecard, '#change_strike' do
  context 'calling the change_strike method' do
    it 'changes the strike' do
      scorecard = Scorecard.new(24, 10, 1)
      batsman1 = Batsman.new('Test1', Probability.new(5, 30, 25, 10, 15, 1, 9, 5))
      batsman2 = Batsman.new('Test2', Probability.new(10, 40, 20, 5, 10, 1, 4, 10))
      scorecard.batsmen_batting_order([batsman1, batsman2])
      scorecard.change_strike()
      expect(scorecard.batsman_on_strike().name).to eq("Test2")
    end
  end
end

RSpec.describe Scorecard, '#get_remaining_balls' do
  context 'calling get_remaining_balls' do
    it 'returns the number of balls remainings' do
      scorecard = Scorecard.new(24, 10, 3)
      expect(scorecard.get_remaining_balls()).to eq 24
    end
  end
end
