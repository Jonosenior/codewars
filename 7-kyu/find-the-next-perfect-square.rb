=begin
Find the next perfect square

You might know some pretty large perfect squares. But what about the NEXT one?

Complete the findNextSquare method that finds the next integral perfect square after the one passed as a parameter. Recall that an integral perfect square is an integer n such that sqrt(n) is also an integer.

If the parameter is itself not a perfect square, than -1 should be returned. You may assume the parameter is positive.

Examples:

findNextSquare(121) --> returns 144
findNextSquare(625) --> returns 676
findNextSquare(114) --> returns -1 since 114 is not a perfect
=end

# Refactored solution
def find_next_square(sq)
  root = Math.sqrt(sq)
  root % 1 == 0 ? (root + 1) ** 2 : -1
end

# Wordier original solution

# def find_next_square(sq)
#   return -1 if !is_perfect_square?(sq)
#   loop do
#     sq += 1
#     return sq if is_perfect_square?(sq)
#   end
# end
#
# def is_perfect_square?(n)
#   Math.sqrt(n) % 1 == 0
# end

puts find_next_square(121) # => 144
puts find_next_square(114) # => -1
