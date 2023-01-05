require 'set'

class SumOfMultiples
  attr_reader :factors

  def initialize(*factors)
    @factors = Set.new(factors)
  end

  def to(limit)
    factors.flat_map do |factor|
      return 0 if factor.zero?

      1.step
       .lazy
       .map { |i| i * factor }
       .take_while { |i| i < limit }
       .force
    end.uniq.sum
  end
end

module BookKeeping
  VERSION = 2
end
