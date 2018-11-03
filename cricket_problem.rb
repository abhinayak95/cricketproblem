


ball_result = [0, 1, 2, 3, 4, 5, 6, 7]
batsmen = ['Kirat Boli', 'NS Nodhi', 'R Rumrah', 'Shashi Henra']
next_bastman = 2
playing_batsmen = ['Kirat Boli', 'NS Nodhi']
on_strike = 0
balls_remaining = 24
wickets_remaining = 3
score_card = {
  'Kirat Boli' => [0, 0],
  'NS Nodhi' => [0, 0],
  'R Rumrah' => [0, 0],
  'Shashi Henra' => [0, 0]
}

batsmen_probability = {
  'Kirat Boli' => {0 => 5, 1 => 30, 2 => 25, 3 => 10, 4 => 15, 5 => 1, 6 => 9, 7 => 5},
  'NS Nodhi' => {0 => 5, 1 => 30, 2 => 25, 3 => 10, 4 => 15, 5 => 1, 6 => 9, 7 => 5},
  'R Rumrah' => {0 => 5, 1 => 30, 2 => 25, 3 => 10, 4 => 15, 5 => 1, 6 => 9, 7 => 5},
  'Shashi Henra' => {0 => 5, 1 => 30, 2 => 25, 3 => 10, 4 => 15, 5 => 1, 6 => 9, 7 => 5},
}

# Kirat Boli    5%        30%   25%   10%   15%   1%    9%    5%
# NS Nodhi      10%       40%   20%   5%    10%   1%    4%    10%
# R Rumrah      20%       30%   15%   5%    5%    1%    4%    20%
# Shashi Henra  30%       25%   10%   0%    5%    1%    4%    30%

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
  puts on_strike
end

for i in 1..40
  if i % 6 == 0
    change_strike()
  end
  # random generator
  puts playing_batsmen[on_strike]
  result = random_weighted(batsmen_probability[playing_batsmen[on_strike]])
  if(result == 7)
    playing_batsmen.delete_at(on_strike)
    playing_batsmen.insert(on_strike,batsmen[next_bastman])
    next_bastman += 1
  elsif(result == 1 || result == 3 || result == 5)
    score_card[playing_batsmen[on_strike]][0] += result
    score_card[playing_batsmen[on_strike]][1] += 1
    change_strike()
  else
    score_card[playing_batsmen[on_strike]][0] += result
    score_card[playing_batsmen[on_strike]][1] += 1
  end
end

puts score_card.to_s
