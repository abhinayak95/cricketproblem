class Batsman
  attr_accessor :name, :runs, :balls_faced, :is_out, : batsmen_probability
  def initialize(name)

  end
  def self.add_runs(runs)
    @runs += runs
    @balls_faced += 1
  end
  def set_status(status)
    @is_out = true
    @balls_faced += 1
  end
end
