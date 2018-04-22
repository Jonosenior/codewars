=begin

Sum of Digits: Digital Root

In this kata, you must create a digital root function.

A digital root is the recursive sum of all the digits in a number. Given n, take the sum of the digits of n. If that value has two digits, continue reducing in this way until a single-digit number is produced. This is only applicable to the natural numbers.

Here's how it works (Ruby example given):

digital_root(16)
=> 1 + 6
=> 7

digital_root(942)
=> 9 + 4 + 2
=> 15 ...
=> 1 + 5
=> 6

=end

# Better version of my original (more concise)

def digital_root(n)
  n = n.to_s.chars.map(&:to_i).reduce(:+) until n < 10
  n
end

# Recursive solution:

# def digital_root(n)
#   return n if n < 10
#   digital_root(n.to_s.chars.map(&:to_i).reduce(:+))
# end

# My original solution

# def digital_root(n)
#   loop do
#     num_arr = n.to_s.chars.map(&:to_i)
#     if num_arr.length > 1
#       n = num_arr.reduce(:+)
#     else
#       return n
#     end
#   end
# end

puts digital_root(16) # => 7
 puts digital_root(942) # => 6
