# Calculate String Rotation

# Write a function that receives two strings and returns n, where n is equal to the number of characters we should shift the first string forward to match the second.
#
# For instance, take the strings "fatigue" and "tiguefa". In this case, the first string has been rotated 5 characters forward to produce the second string, so 5 would be returned.
#
# If the second string isn't a valid rotation of the first string, the method returns -1.
# Examples:
# "coffee", "eecoff" => 2
# "eecoff", "coffee" => 4
# "moose", "Moose" => -1
# "isn't", "'tisn" => 2
# "Esham", "Esham" => 0
# "dog", "god" => -1

# Strategy
#   Add the shift difference in index between first letter of first and wherever it appears in second.
#   Apply that difference to each character of first.
      # 1) Create a shifted_first array where length = first.length and all empty.
      # 2) Each_with_index over first, adding each letter to shifted_first at index position index-in-first + shift
#     Remember to wrap around if the index is longer than length of word - 1.
      # if index > first.length-1 then index = index minus length
#  If shifted_first == second, then return the index. If not, return -1.

# Improvements to make:
  # 1) Creation of shifted_first array could be cleaner. Use the %w trick?

def shifted_diff(first, second)
  first, second = first.split(""), second.split("")
  shift = second.index(first[0])
  return -1 if !shift
  shift_array(first, shift) == second ? shift : -1
end

def shift_array(arr, shift)
  shifted_arr = []
  (arr.length).times { shifted_arr << " " }
  arr.each_with_index do |letter, index|
    new_index = index + shift
    new_index = new_index - arr.length if new_index > arr.length - 1
    shifted_arr[new_index] = letter
  end
  shifted_arr
end

puts shifted_diff("coffee", "eecoff") # 2
puts shifted_diff("eecoff", "coffee") # 4
puts shifted_diff("moose", "Moose") #  => -1
puts shifted_diff("isn't", "'tisn") # => 2
puts shifted_diff("Esham", "Esham") # => 0
puts shifted_diff("dog", "god") # => -1
