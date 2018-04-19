=begin

Complementary DNA

Deoxyribonucleic acid (DNA) is a chemical found in the nucleus of cells and carries the "instructions" for the development and functioning of living organisms.

If you want to know more http://en.wikipedia.org/wiki/DNA

In DNA strings, symbols "A" and "T" are complements of each other, as "C" and "G". You have function with one side of the DNA (string, except for Haskell); you need to get the other complementary side. DNA strand is never empty or there is no DNA at all (again, except for Haskell).

=end

def DNA_strand(dna)
  complements = {"A" => "T", "T" => "A", "C" => "G", "G" => "C"}
  dna.split("").map { |a| complements[a] }.join
end

# Alternative solution (found on Codewars):
# def DNA_strand(dna)
#   dna.tr("ACTG", "TGAC")
# end

puts DNA_strand("AAAA") # TTTT
puts DNA_strand("ATTGC") # TAACG
