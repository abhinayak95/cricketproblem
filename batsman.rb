class Batsman
  attr_accessor :name, :runs, :balls_faced, :is_out, :probability
  def initialize(name, probability)
    @name = name
    @probability = probability
    @runs = 0
    @balls_faced = 0
    @is_out = false
  end
  def add_runs(runs)
    @runs += runs
    @balls_faced += 1
  end
  def set_status(status)
    @is_out = true
    @balls_faced += 1
  end
  def get_probability()
    return @probability.get_probability()
  end
  def get_scorecard
    if @is_out
      return "#{runs} (#{balls_faced} balls)"
    elsif @balls_faced == 0
      return "DNB"
    else
      return "#{runs}* (#{balls_faced} balls)"
    end
  end
end
