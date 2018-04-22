# Notes on 5kyu Challenges

## Number of trailing zeros of N!

  This challenge asks to find the number of trailing zeros in the factorial of a given number. For example, the factorial of 23! is 25852016738884976640000, which has four trailing zeros. The tricky part is that factorial calculations are too large to actually perform in the method - the solution needs to use a shortcut somehow.

  I researched a shortcut on maths forums (rather than working it out myself), and found one [here](http://www.purplemath.com/modules/factzero.htm). The method overview is:
    * Take the number that you've been given the factorial of.
    * Divide by 5; if you get a decimal, truncate to a whole number.
    * Divide by 52 = 25; if you get a decimal, truncate to a whole number.
    * Divide by 53 = 125; if you get a decimal, truncate to a whole number.
    * Continue with ever-higher powers of 5, until your division results in a number less than 1. Once the division is less than 1, stop.
    * Sum all the whole numbers you got in your divisions. This is the number of trailing zeroes.

  That's what I recreate in my method. I use recursion to perform the multiplication by increasing powers of five, where the base case is if the division produces a number less than one.
