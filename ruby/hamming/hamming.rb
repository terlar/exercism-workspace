# Computer the Hamming difference for DNA strands
class Hamming
  def self.compute(dna_a, dna_b)
    unless dna_a.length == dna_b.length
      raise ArgumentError, 'Strands have different length'
    end

    dna_a.chars.zip(dna_b.chars).count { |a, b| a != b }
  end
end

module BookKeeping
  VERSION = 3
end
