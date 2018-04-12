=begin
Increment String

Your job is to write a function which increments a string, to create a new string.
If the string already ends with a number, the number should be incremented by 1.
If the string does not end with a number the number 1 should be appended to the new string.

Examples:
foo -> foo1
foobar23 -> foobar24
foo0042 -> foo0043
foo9 -> foo10
foo099 -> foo100

Attention: If the number has leading zeros the amount of digits should be considered.

=end

def increment_string(input)
  closing_digits = return_closing_digits(input)
  iterated_closing_digits = iterate_by_1(closing_digits)
  return input + '1' if iterated_closing_digits.empty?
  input.reverse.sub(/^\d*/, '').reverse + iterated_closing_digits
end

def return_closing_digits(input)
  input.split('').reverse.join.match(/^\d*/).to_s.reverse
end

def iterate_by_1(input)
  num = input.to_i + 1
  num.to_s.rjust(input.to_s.size,'0')
end

puts increment_string("foo4bar23") # foo4bar24
puts increment_string("foobar001") # foo4bar002
puts increment_string("foobar00") # foo4bar01
puts increment_string("foobar99") # foobar100
puts increment_string("foobar") # foobar1
