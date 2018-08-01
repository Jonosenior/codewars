require 'minitest/autorun'
=begin

Consecutive Strings

You are given an array strarr of strings and an integer k. Your task is to return the first longest string consisting of k consecutive strings taken in the array.

#Example: longest_consec(["zone", "abigail", "theta", "form", "libe", "zas", "theta", "abigail"], 2) --> "abigailtheta"

n being the length of the string array, if n = 0 or k > n or k <= 0 return "".

=end

# Refactored solution

def longest_consec(strarr, k)
  return "" if k < 1 || k > strarr.length
  strarr.each_cons(k).map(&:join).max_by(&:length)
end

# Original, unrefactored solution.

# def longest_consec(strarr, k)
#   return "" if k < 1 || k > strarr.length
#   longest_count = 0
#   longest_str = ""
#
#   strarr.each_with_index do |a, i|
#     superstr = strarr[i .. (i + k - 1)].join
#     if superstr.length > longest_count
#       longest_str = superstr
#       longest_count = superstr.length
#     end
#   end
#   longest_str
# end

class ConsecutiveStringTest < Minitest::Test

  def test_2_consecutive_strings
    result = longest_consec(["zone", "abigail", "theta", "form", "libe", "zas"], 2)
    assert_equal "abigailtheta", result
  end

  def test_1_consecutive_string
    result = longest_consec(["ejjjjmmtthh", "zxxuueeg", "aanlljrrrxx", "dqqqaaabbb", "oocccffuucccjjjkkkjyyyeehh"], 1)
    assert_equal "oocccffuucccjjjkkkjyyyeehh", result
  end

  def test_with_empty_array
    result = longest_consec([], 3)
    assert_equal "", result
  end

  def test_negative_k
    result = longest_consec(["zone", "abigail", "theta", "form", "libe", "zas"], -2)
    assert_equal "", result
  end

  def test_k_larger_than_array_length
    result = longest_consec(["it","wkppv","ixoyx", "3452", "zzzzzzzzzzzz"], 15)
    assert_equal "", result
  end

end
