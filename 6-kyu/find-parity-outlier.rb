=begin

You are given an array (which will have a length of at least 3, but could be very large) containing integers. The array is either entirely comprised of odd integers or entirely comprised of even integers except for a single integer N. Write a method that takes the array as an argument and returns this "outlier" N.

Examples
[2, 4, 0, 100, 4, 11, 2602, 36]
Should return: 11 (the only odd number)

[160, 3, 1719, 19, 11, 13, -21]
Should return: 160 (the only even number)


=end

# # Very nice solution taken from CodeWars
#
# def find_outlier(integers)
#   outlier = integers.first(3).count(&:even?) > 1 ? :odd? : :even?
#   integers.find(&outlier)
# end

# My original solution:

def find_outlier(integers)
  norm = (integers[0] % 2 == integers[1] % 2) ? integers[0] % 2 : integers[2] % 2
  integers.each { |a| return a if a % 2 != norm }
end

puts find_outlier([2, 4, 0, 100, 4, 11, 2602, 36]) # => 11
puts find_outlier([160, 3, 1719, 19, 11, 13, -21]) # => 160
