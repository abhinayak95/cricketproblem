class Probability
  attr_accessor :zeros, :ones, :twos, :threes, :fours, :fives, :sixes, :out
  def initialize(zeros, ones, twos, threes, fours, fives, sixes, out)
    @zeros = zeros
    @ones = ones
    @twos = twos
    @threes = threes
    @fours = fours
    @fives = fives
    @sixes = sixes
    @out = out
  end
  def get_probability()
    return { 0 => @zeros, 1 => @ones, 2 => @twos, 3 => @threes, 4 => @fours, 5 => @fives, 6 => @sixes, 'out' => @out }
  end
end
