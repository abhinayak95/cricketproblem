class Scorecard
  attr_accessor :balls_remaining, :runs_scored, :runs_remaining,
                :wickets_remaining, :batsmen_scorecard, :playing_batsmen, :on_strike

  def initialize(balls_remaining, runs_remaining, wickets_remaining)
    @balls_remaining = balls_remaining
    @runs_remaining = runs_remaining
    @wickets_remaining = wickets_remaining
    @runs_scored = 0
    @on_strike = 0
  end

  def increase_score(score)
    @runs_scored += score
  end

  def get_runs_scored
    return @runs_scored
  end

  def get_remaining_wickets
    return @wickets_remaining
  end

  def next_batsman()
    @wickets_remaining -= 1
    self.batsman_on_strike().is_out = true
    self.batsman_on_strike().add_runs(0)
    @playing_batsmen.delete_at(@on_strike)
    begin
      @playing_batsmen.insert(@on_strike, @batsmen_batting_order.next)
    rescue StopIteration
    end
  end


  def batsmen_batting_order(batsmen_batting_order)
    @batsmen_batting_order = batsmen_batting_order.each()
    @batsmen_scorecard = batsmen_batting_order.each()
    @playing_batsmen = [@batsmen_batting_order.next, @batsmen_batting_order.next]
  end

  def get_remaining_balls
    return @balls_remaining
  end

  def get_scorecard
    @batsmen_scorecard.map{
      |batsman|
      puts batsman.get_scorecard()
        }
  end

  def change_strike
    @on_strike = (@on_strike.to_i + 1) % 2
  end

  def batsman_on_strike
    return @playing_batsmen[@on_strike]
  end

end
