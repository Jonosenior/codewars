=begin
Shortest Word

Simple, given a string of words, return the length of the shortest word(s).

String will never be empty and you do not need to account for different data types.

Nice solution found on CodeWars:
# def find_short(s)
#   s.split(" ").map(&:size).min
# end

=end

def find_short(s)
  s.split(" ").sort_by(&:length).first.length
end

puts find_short("bitcoin take over the world maybe who knows perhaps") # => 3)
