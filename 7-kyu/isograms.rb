=begin

Isogram

An isogram is a word that has no repeating letters, consecutive or non-consecutive. Implement a function that determines whether a string that contains only letters is an isogram. Assume the empty string is an isogram. Ignore letter case.

is_isogram("Dermatoglyphics" ) == true
is_isogram("aba" ) == false
is_isogram("moOse" ) == false # -- ignore letter case

=end

def is_isogram(string)
  string.downcase.chars.uniq == string.downcase.chars
end

# Original, suboptimal solution

# def is_isogram(string)
#   arr = string.downcase.split("")
#   arr.length.times do
#     return false if arr.include?(arr.pop)
#   end
#   true
# end

puts is_isogram("Dermatoglyphics") # => true
puts is_isogram("aba") # => false
