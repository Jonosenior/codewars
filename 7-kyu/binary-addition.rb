=begin
Binary Addition

Implement a function that adds two numbers together and returns their sum in binary. The conversion can be done before, or after the addition.

The binary number returned should be a string.

=end

def add_binary(a,b)
  (a+b).to_s(2)
end


puts add_binary(1,1) # "10"
puts add_binary(0,1) # ,"1")
puts add_binary(1,0) # ,"1")
puts add_binary(2,2) # ,"100")
puts add_binary(51,12) # ,"111111")
