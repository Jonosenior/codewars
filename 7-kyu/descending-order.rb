=begin
Descending Order

Your task is to make a function that can take any non-negative integer as a argument and return it with its digits in descending order. Essentially, rearrange the digits to create the highest possible number.

Examples:
Input: 21445 Output: 54421

Input: 145263 Output: 654321

Input: 1254859723 Output: 9875543221

=end

def descending_order(n)
  n.to_s.split("").map(&:to_i).sort.reverse.join.to_i
end

print descending_order(123456789) # => 987654321
print descending_order(1021) # => 2110
