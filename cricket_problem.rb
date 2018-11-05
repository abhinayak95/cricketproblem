require_relative "batsman.rb"
require_relative "probability.rb"
require_relative "scorecard.rb"
require_relative "weighted_random_generator.rb"


random_generator = RandomGenerator.new()

batsman1 = Batsman.new('Kirat Boli', Probability.new(5, 30, 25, 10, 15, 1, 9, 5))
batsman2 = Batsman.new('NS Nodhi', Probability.new(10, 40, 20, 5, 10, 1, 4, 10))
batsman3 = Batsman.new('R Rumrah', Probability.new(20, 30, 15, 5, 5, 1, 4, 20))
batsman4 = Batsman.new('Shashi Henra', Probability.new(30, 25, 10, 0, 5, 1, 4, 30))

scorecard.batsmen_batting_order([batsman1, batsman2, batsman3, batsman4])

scorecard = Scorecard.new(24, 40, 3)

scorecard.balls_remaining().times do |i|
  scorecard.balls_remaining -= 1
  if i % 6 == 0
    scorecard.change_strike()
  end

  result = random_generator.random_weighted(scorecard.batsman_on_strike().get_probability())

  if(result == 'out')
    scorecard.batsman_on_strike().is_out = true;
    scorecard.batsman_on_strike().add_runs(0)
    scorecard.next_batsman()
    break if scorecard.get_remaining_wickets == 0
  else
    scorecard.batsman_on_strike.add_runs(result)
    scorecard.increase_score(result)
    break if scorecard.get_runs_scored() >= 40
    if(result == 1 || result == 3 || result == 5)
      scorecard.change_strike()
    end
  end
end

if scorecard.get_runs_scored() - 40 >= 0
  puts "India won by #{scorecard.get_remaining_wickets()} wickets and #{scorecard.get_remaining_balls()} balls remaining"
else
  puts "India lost by #{40 - scorecard.get_runs_scored()} runs"
end

scorecard.get_scorecard()
