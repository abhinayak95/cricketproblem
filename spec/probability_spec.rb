require_relative "../probability.rb"

RSpec.describe Probability, "#get_probability" do
  context "Given the initial values" do
    it "return a hash with respective valuse" do
      probability = Probability.new(0,1,2,3,4,5,6,7)
      result = probability.get_probability()
      expect(result).to eq ({
        0 => 0,
        1 => 1,
        2 => 2,
        3 => 3,
        4 => 4,
        5 => 5,
        6 => 6,
        'out' => 7
      })
    end
  end
end

RSpec.describe Probability, "#get_probability" do
  context "Given the initial values" do
    it "throws an error if arguments are less than expected" do
      expect {
        probability = Probability.new(0,1,2,3,4,5,6)
      }.to raise_error(ArgumentError)
    end
  end
end

RSpec.describe Probability, "#get_probability" do
  context "Given the initial values" do
    it "throws an error if arguments are more than expected" do
      expect {
        probability = Probability.new(0,1,2,3,4,5,6,7,8)
      }.to raise_error(ArgumentError)
    end
  end
end
