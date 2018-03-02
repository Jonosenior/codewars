=begin
Once upon a time, on a way through the old wild west,…
… a man was given directions to go from one point to another. The directions were "NORTH", "SOUTH", "WEST", "EAST". Clearly "NORTH" and "SOUTH" are opposite, "WEST" and "EAST" too. Going to one direction and coming back the opposite direction is a needless effort. Since this is the wild west, with dreadfull weather and not much water, it's important to save yourself some energy, otherwise you might die of thirst!

How I crossed the desert the smart way.
The directions given to the man are, for example, the following:

["NORTH", "SOUTH", "SOUTH", "EAST", "WEST", "NORTH", "WEST"].

[North, South, South, East, West, North, West]
You can immediatly see that going "NORTH" and then "SOUTH" is not reasonable, better stay to the same place! So the task is to give to the man a simplified version of the plan. A better plan in this case is simply:

["WEST"]

The path becomes ["EAST", "WEST"], now "EAST" and "WEST" annihilate each other, therefore, the final result is [] (nil in Clojure).

In ["NORTH", "EAST", "WEST", "SOUTH", "WEST", "WEST"], "NORTH" and "SOUTH" are not directly opposite but they become directly opposite after the reduction of "EAST" and "WEST" so the whole path is reducible to ["WEST", "WEST"].

Task
Write a function dirReduc which will take an array of strings and returns an array of strings with the needless directions removed (W<->E or S<->N side by side).
=end

# My solution

def dirreduc(arr)
  solution = []
  arr.each_with_index do |direction, i|
    if arr[i+1] != opposite_direction(direction)
      solution << direction << arr[i+1]
    end
  end
  solution
end

def opposite_direction(dir)
  opps = { "NORTH" => "SOUTH", "SOUTH" => "NORTH", "EAST" => "WEST", "WEST" => "EAST" }
  opps[dir]
end

print dirreduc(["NORTH", "WEST", "SOUTH", "EAST"])
print dirreduc(["NORTH", "WEST", "EAST"])




# vertical_difference = arr.count("NORTH") - arr.count("SOUTH")
# horizontal_difference = arr.count("WEST") - arr.count("EAST")
# directions.each do { }



# if vertical_difference > 0
#   vertical_difference.times { solution << "NORTH" }
# elsif vertical_difference < 0
#   vertical_difference.abs.times { solution << "SOUTH" }
# end
# if horizontal_difference > 0
#   horizontal_difference.times { solution << "WEST" }
# elsif horizontal_difference < 0
#   horizontal_difference.abs.times { solution << "EAST" }
# end
# puts solution
