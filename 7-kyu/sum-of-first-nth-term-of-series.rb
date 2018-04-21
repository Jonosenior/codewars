=begin

Sum of the first nth term of Series

Your task is to write a function which returns the sum of following series upto nth term(parameter).

Series: 1 + 1/4 + 1/7 + 1/10 + 1/13 + 1/16 +...
Rules:
You need to round the answer to 2 decimal places and return it as String.

If the given value is 0 then it should return 0.00

You will only be given Natural Numbers as arguments.

Examples:
SeriesSum(1) => 1 = "1.00"
SeriesSum(2) => 1 + 1/4 = "1.25"
SeriesSum(5) => 1 + 1/4 + 1/7 + 1/10 + 1/13 = "1.57"

=end

def series_sum(n)
  sum = (1..n).map { |a| 1/(a*3-2).to_f }.reduce(&:+)
  sprintf('%.2f', sum || 0)
end

puts series_sum(1) # => 1 = "1.00"
puts series_sum(2) # => 1 + 1/4 = "1.25"
puts series_sum(5) # => 1 + 1/4 + 1/7 + 1/10 + 1/13 = "1.57"
puts series_sum(0) # => 1 = "1.00"
