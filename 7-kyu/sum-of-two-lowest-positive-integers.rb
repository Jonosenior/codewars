=begin
Sum of two lowest positive integers

Create a function that returns the sum of the two lowest positive numbers given an array of minimum 4 integers. No floats or empty arrays will be passed.

For example, when an array is passed like [19, 5, 42, 2, 77], the output should be 7.

[10, 343445353, 3453445, 3453545353453] should return 3453455.

Hint: Do not modify the original array.

=end

def sum_two_smallest_numbers(numbers)
  numbers.sort[0] + numbers.sort[1]
end

puts sum_two_smallest_numbers([5, 8, 12, 18, 22]) # => 13
puts sum_two_smallest_numbers([7, 15, 12, 18, 22]) # => 19
