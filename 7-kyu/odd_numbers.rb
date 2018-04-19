=begin

Odd Numbers

Given two numbers, return all the odd numbers on the range between them.

eg: Given 2 and 5, return [3,5].

=end

def oddNumbers(l, r)
    (l...r).to_a.select { |a| a % 2 != 0}
end

puts oddNumbers(2, 5)
