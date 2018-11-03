class Scorecard
  attr_accessor :balls_remaining, :runs_scored, :runs_remaining, :wickets_remaining, :first_batsman, :second_batsman, :batsmen_order, :playing_batsmen

  def initialize(balls_remaining, runs_remaining, wickets_remaining)
    @balls_remaining = balls_remaining
    @runs_remaining = runs_remaining
    @wickets_remaining = wickets_remaining
    @runs_scored = 0
  end

  def get_statistics()
    return @balls_remaining, @runs_scored
  end

  def increase_score(score)
    @runs_scored += score
  end

  def get_score
    return @runs_scored
  end

  def next_batsman()
    wickets_remaining -= 1
    @playing_batsmen.delete_at(on_strike)
    @playing_batsmen.insert(on_strike,batsmen[next_bastman])
  end

  def get_wickets
    return @wickets_remaining
  end

  def batsmen_order(batsmen_order)
    @batsmen_order = batsmen_order
  end

  def get_playing_batsmen()
    @playing_batsmen = [batsmen_order.next, batsmen_order.next]
    return @playing_batsmen
  end

  # def set_playing_batsmen()
  #   return [batsmen_order.next, batsmen_order.next]
  # end

end
