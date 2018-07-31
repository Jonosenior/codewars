require 'minitest/autorun'

=begin
The goal of this exercise is to convert a string to a new string where each character in the new string is
'(' if that character appears only once in the original string, or ')' if that character appears more than
once in the original string. Ignore capitalization when determining if a character is a duplicate.

Examples:

"din" => "((("

"recede" => "()()()"

"Success" => ")())())"

"(( @" => "))(("

=end

def duplicate_encode(word)
  answer = word.downcase.chars.map do |a|
    word.downcase.count(a) > 1 ? ")" : "("
  end
  answer.join
end

class DuplicateEncoderTest < Minitest::Test
  def test_no_duplicates
    result = duplicate_encode("din")
    assert_equal "(((", result, "A string with no duplicate characters should return '((('"
  end

  def test_with_duplicates
    result = duplicate_encode("recede")
    assert_equal "()()()", result, "A string with a duplicated and non-duplicated characters should return correct result"
  end

  def test_with_capitals
    result = duplicate_encode("Success")
    assert_equal ")())())", result, "A string with a capitals should return correct result"
  end

  def test_with_symbols
    result = duplicate_encode("(( @")
    assert_equal "))((", result, "A string made of symbols should return correct result"
  end

  def test_another_capitalised_string
    result = duplicate_encode("Supralapsarian")
    assert_equal  ")()))()))))()(", result, "Capitalisation should be ignored"
  end


end
