require_relative "../batsman.rb"
require_relative "../probability.rb"

RSpec.describe "Batsman", "#add_runs" do
  context "given the runs" do
    it "should be able to add runs" do
      batsman = Batsman.new("Test", Probability.new(5,5,5,5,5,5,5,5))
      batsman.add_runs(5)
      expect(batsman.runs).to eq (5)
    end
  end
end

RSpec.describe "Batsman", "#add_runs" do
  context "given no runs ie., no arguments" do
    it "throws an ArgumentError exception" do
      batsman = Batsman.new("Test", Probability.new(5,5,5,5,5,5,5,5))
      expect {
        batsman.add_runs()
      }.to raise_error(ArgumentError)
    end
  end
end

RSpec.describe "Batsman", "#add_runs" do
  context "given the runs in string format" do
    it "should be able to add runs" do
      batsman = Batsman.new("Test", Probability.new(5,5,5,5,5,5,5,5))
      batsman.add_runs("3")
      expect(batsman.runs).to eq (3)
    end
  end
end

RSpec.describe "Batsman", "#add_runs" do
  context "given the runs in string format" do
    it "should be able to add nils" do
      batsman = Batsman.new("Test", Probability.new(5,5,5,5,5,5,5,5))
      batsman.add_runs(5)
      batsman.add_runs(nil)
      expect(batsman.runs).to eq (5)
    end
  end
end

RSpec.describe "Batsman", "#add_runs" do
  context "given the batsman" do
    it "should be able to get his probability" do
      batsman = Batsman.new("Test", Probability.new(5,10,15,20,25,30,35,40))
      result = batsman.get_probability()
      expect(result).to eq ({
        0 => 5,
        1 => 10,
        2 => 15,
        3 => 20,
        4 => 25,
        5 => 30,
        6 => 35,
        'out' => 40
        })
    end
  end
end

RSpec.describe "Batsman", "#add_runs" do
  context "given the batsman" do
    it "should be able to get his scorecard when the batsman is out" do
      batsman = Batsman.new("Test", Probability.new(5,5,5,5,5,5,5,5))
      result = batsman.get_scorecard()
      expect(result).to eq ("Test 0 (0 balls)")
    end
  end
end

RSpec.describe "Batsman", "#add_runs" do
  context "given the batsman" do
    it "should be able to get his scorecard when the batsman is not out" do
      batsman = Batsman.new("Test", Probability.new(5,5,5,5,5,5,5,5))
      batsman.add_runs(0)
      result = batsman.get_scorecard()
      expect(result).to eq ("Test 0* (1 balls)")
    end
  end
end
