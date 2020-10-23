class Complement
  DICTIONARY = {
    "G" => "C",
    "C" => "G",
    "T" => "A",
    "A" => "U",
  }.freeze

  def self.of_dna(dna_strand)
    dna_strand.chars.map { |char| DICTIONARY[char] || break }.to_a.join
  end
end

module BookKeeping
  VERSION = 4
end
