=begin

Is this a triangle?

Implement a method that accepts 3 integer values a, b, c. The method should return true if a triangle can be built with the sides of given length and false in any other case.

(In this case, all triangles must have surface greater than 0 to be accepted).

=end

# Optimal solution taken from CodeWars best-rated.

def isTriangle(a,b,c)
  a,b,c = [a,b,c].sort
  a + b > c
end

# Original Solution, refactored to one line.

# def isTriangle(a,b,c)
#   a + b > c && a + c > b && b + c > a
# end

puts isTriangle(1,2,2) # => true
puts isTriangle(7,2,2) # => false
puts isTriangle(0,2,2) # => false
