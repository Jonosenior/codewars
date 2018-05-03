# Reverse a string (without using #reverse...)

def reverse_string(str)
  reversed = []
  split_str = str.split("")
  split_str.length.times { reversed << split_str.pop }
  reversed.join
end

def reverse_string(str)

end

puts reverse_string("hello")
