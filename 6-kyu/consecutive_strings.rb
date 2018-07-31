require 'minitest/autorun'
=begin

Consecutive Strings

You are given an array strarr of strings and an integer k. Your task is to return the first longest string consisting of k consecutive strings taken in the array.

#Example: longest_consec(["zone", "abigail", "theta", "form", "libe", "zas", "theta", "abigail"], 2) --> "abigailtheta"

n being the length of the string array, if n = 0 or k > n or k <= 0 return "".

=end



def longest_consec(strarr, k)
  ###
end

class ConsecutiveStringTest < Minitest::Test

  def test_2_consecutive_strings
    result = longest_consec(["zone", "abigail", "theta", "form", "libe", "zas", "theta", "abigail"], 2)
    assert_equal "abigailtheta", result
  end

end
