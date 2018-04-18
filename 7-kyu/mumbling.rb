=begin
Mumbling

This time no story, no theory. The examples below show you how to write function accum:

Examples:

accum("abcd")    # "A-Bb-Ccc-Dddd"
accum("RqaEzty") # "R-Qq-Aaa-Eeee-Zzzzz-Tttttt-Yyyyyyy"
accum("cwAt")    # "C-Ww-Aaa-Tttt"
The parameter of accum is a string which includes only letters from a..z and A..Z.

=end

def accum(s)
  ans = s.downcase.split("").map.with_index do |l, i|
    l.upcase + l.downcase * i
  end
  ans.join("-")
end

puts accum("abcd") # "A-Bb-Ccc-Dddd"
puts accum("RqaEzty") # "R-Qq-Aaa-Eeee-Zzzzz-Tttttt-Yyyyyyy"
puts accum("cwAt")    # "C-Ww-Aaa-Tttt"
