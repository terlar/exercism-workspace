# Binary Search Tree implementation
class Bst
  attr_reader :data, :left, :right

  def initialize(data)
    @data = data
  end

  def each(&block)
    return enum_for(:each) unless block_given?

    left.each(&block) unless left.nil?
    yield data
    right.each(&block) unless right.nil?
  end

  def insert(value)
    if value > data
      insert_value(:right, value)
    else
      insert_value(:left, value)
    end
  end

  private

  def insert_value(target, value)
    if send(target).nil?
      instance_variable_set("@#{target}", self.class.new(value))
    else
      send(target).insert(value)
    end
  end
end

module BookKeeping
  VERSION = 1
end
