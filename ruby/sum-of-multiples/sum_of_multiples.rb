require 'set'

class SumOfMultiples
  attr_reader :factors

  def initialize(*factors)
    @factors = Set.new(factors)
  end

  def to(limit)
    natural_numbers(from: factors.min, to: limit - 1)
      .select(&method(:multiple?))
      .sum
  end

  private

  def multiple?(number)
    factors.any? { |factor| (number % factor).zero? }
  end

  def natural_numbers(from:, to:)
    if from && to
      from.upto(to)
    else
      []
    end
  end
end

module BookKeeping
  VERSION = 2
end
