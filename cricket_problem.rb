require_relative "batsman.rb"

batsman1 = Batsman.new('Kirat Boli', {0 => 5, 1 => 30, 2 => 25, 3 => 10, 4 => 15, 5 => 1, 6 => 9, 7 => 5})
batsman2 = Batsman.new('NS Nodhi', {0 => 10, 1 => 40, 2 => 20, 3 => 5, 4 => 10, 5 => 1, 6 => 4, 7 => 10})
batsman3 = Batsman.new('R Rumrah', {0 => 20, 1 => 30, 2 => 15, 3 => 5, 4 => 5, 5 => 1, 6 => 4, 7 => 20})
batsman4 = Batsman.new('Shashi Henra', {0 => 30, 1 => 25, 2 => 10, 3 => 0, 4 => 5, 5 => 1, 6 => 4, 7 => 30})

batsmen = [batsman1, batsman2, batsman3, batsman4]
next_bastman = 2
playing_batsmen = [batsman1, batsman2]
on_strike = 0
balls_remaining = 24
wickets_remaining = 3
runs_scored = 0

def random_weighted(weighted)
  max    = sum_of_weights(weighted)
  target = rand(1..max)
  weighted.each do |item, weight|
    return item if target <= weight
    target -= weight
  end
end

def sum_of_weights(weighted)
  weighted.inject(0) { |sum, (item, weight)| sum + weight }
end

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
  result = random_weighted(batsman.get_probability())
  if(result == 7)
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
