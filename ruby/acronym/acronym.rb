# Abbreviate a phrase.
#
# Find all the first word characters at the beginning of the word boundary or a
# character that starts with a uppercase letter and followed by a lowercase
# letter. Then construct a string from the first character and uppercase it.
#
# NOTE: This is not part of the test-suite, but this ensures also phrases such
# as HyperText Markup Language are supported.
class Acronym
  def self.abbreviate(phrase)
    phrase.scan(/\b\w|[A-Z][a-z]/).reduce("") do |memo, word|
      memo + word.chr.upcase
    end
  end
end

module BookKeeping
  VERSION = 4
end
