require_relative "batsman.rb"
require_relative "probability.rb"
require_relative "scorecard.rb"
require_relative "weighted_random_generator.rb"

scorecard = Scorecard.new(24, 40, 3)

random_generator = RandomGenerator.new()

batsman1 = Batsman.new('Kirat Boli', Probability.new(5, 30, 25, 10, 15, 1, 9, 5))
batsman2 = Batsman.new('NS Nodhi', Probability.new(10, 40, 20, 5, 10, 1, 4, 10))
batsman3 = Batsman.new('R Rumrah', Probability.new(20, 30, 15, 5, 5, 1, 4, 20))
batsman4 = Batsman.new('Shashi Henra', Probability.new(30, 25, 10, 0, 5, 1, 4, 30))


scorecard.batsmen_order([batsman1, batsman2, batsman3, batsman4].each)
playing_batsmen = scorecard.get_playing_batsmen()
on_strike = 0
balls_remaining = 24
wickets_remaining = 3
runs_scored = 0

def change_strike
  on_strike = (on_strike.to_i + 1) % 2
  # puts on_strike
end

24.times do |i|
  balls_remaining -= 1
  if i % 6 == 0
    change_strike()
  end
  # random generator
  # puts playing_batsmen[on_strike]
  batsman =batsman1
  # puts 'this' + batsman.to_s
  result = random_generator.random_weighted(batsman.get_probability())

  if(result == 'out')
    playing_batsmen[on_strike].is_out = true;
    playing_batsmen[on_strike].add_runs(0)
    playing_batsmen.delete_at(on_strike)
    playing_batsmen.insert(on_strike,batsmen[next_bastman])
    next_bastman += 1
    wickets_remaining -= 1
    break if wickets_remaining == 0
  elsif(result == 1 || result == 3 || result == 5)
    playing_batsmen[on_strike].add_runs(result)
    runs_scored += result
    change_strike()
    break if runs_scored >= 40
  else
    playing_batsmen[on_strike].add_runs(result)
    runs_scored += result
    break if runs_scored >= 40
  end
end

if runs_scored - 40 >= 0
  puts "India won by #{wickets_remaining} wickets and #{balls_remaining} balls remaining"
else
  puts "India lost by #{40 - runs_scored} runs"
end
batsmen.each{
  |batsman|
  puts batsman.name + ' ' + batsman.get_scorecard()
}
