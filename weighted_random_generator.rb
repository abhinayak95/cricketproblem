class RandomGenerator

  def random_weighted(weighted)
    max = sum_of_weights(weighted)
    target = rand(1..max)
    weighted.each do |item, weight|
      return item if target <= weight
      target -= weight
    end
  end

  def sum_of_weights(weighted)
    weighted.inject(0) { |sum, (item, weight)| sum + weight }
  end

end
