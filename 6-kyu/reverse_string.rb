# Reverse a string (without using #reverse...)

def reverse_string(str)
  reversed = []
  split_str = str.split("")
  split_str.length.times { reversed << split_str.pop }
  reversed.join
end

puts reverse_string("hello")
