# NEXT: use binding.pry to find out why it's not working for the given input

def find_even_index(arr)
  return 0 if sum_array(arr.drop(1)).zero?
  arr.each_with_index do |a, i|
    next if i == 0
    left = arr[(0..i-1)]
    right = arr[(i+1..-1)]
    return i if sum_array(left) == sum_array(right)
  end
  return -1
end

def sum_array(arr)
  arr.reduce(:+)
end

# puts sum_array([1,2,3])

# puts find_even_index([1,2,3,4,3,2,1])
# puts find_even_index([1,100,50,-51,1,1])
# puts find_even_index([20,10,-80,10,10,15,35])
# puts find_even_index([20,10,-80,10,10,15,35])
#puts sum_array([20,10,-80,10,10,15,35])
puts find_even_index([10,-80,10,10,15,35,20])
