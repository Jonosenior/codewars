# Notes on 6-Kyu Challenges

## Decode the Morse Code

  Challenge: Given a string of morse code, return its translation. Letters are seperated by a single space; words by three spaces. Leading and trailing whitespace should be left out.

  Solution: Save a hash with morse code as key/val pairs. Remove the extraneous whitespace from the string with #strip, then split the array into constituent words with #split('   '). Iterate over each word (subarray), and then convert each character with the morse code hash. Join the characters together, and then the words (sub-arrays) together with a space. Voila!

  Notes: I found the trickiest part of this was dealing with the whitespace - how to differentiate between the single space for letters and the triple space for words. At first I tried to split the whole string into its characters, keeping the triple spaces as markers of a new word. But this was too hard: it's much better to return a 2d-array where each subarray is a word. To get this, you need to first split by triple space character: split('   ').

  To remove leading and trailing whitespace, I used gsub and the following regex: /(^\s+)|(\s+$)/. There's actually an easier way in Ruby: use the #strip method.

## Find the Parity Outlier

  Challenge: Given an array of integers, all but one of which are odd or even, return the outlier element.

  Original Solution: Determine if the pattern is odd or even by comparing the first two elements. If they match then take the first element % 2 as the overall pattern; if they don't (with 'element % 2') then the third element % 2 will give you the overall pattern. Then iterate over the array and return the first element that doesn't match this norm.

  Notes: The top-rated Ruby solutions have extremely useful methods I didn't know about:
  * #odd? and #even? (rather than doing my wordier 'x % 2 == 0' way).
  * #partition? is an iterator that returns two arrays - the first contains those elements from the original array for which the block resolves as true; the second for the rest. BUT, if the array gets very long, this would take a long time to process (because it divides the whole array, whereas you just need to check the first three to know if the pattern is odd or even.)
  * #find is an enumerator method. If passed a block, it returns the FIRST result for which the block is not false.
  * #first takes an optional argument, so you can return the first x elements of an array. eg: arr.first(3).

  Improved solution (taken from CodeWars):
  ```
  def find_outlier(integers)
    outlier = integers.first(3).count(&:even?) > 1 ? :odd? : :even?
    integers.find(&outlier)
  end
  ```
  This is really elegant, because you use the first three elements to work out if the outlier is odd or even, and you return that as a symbol which references the #:odd? or #:even? methods, saved as the 'outlier' variable. You then pass that variable to #find, which returns the outlier element.

## Sum of Digits (Digital Root)

  Challenge: Create a digital root function. The digital root is the recursive sum of all the digits of an integer. Given n, return the sum of the digits of n; if the sum has more than one digit, repeat until a single digit sum is produced.

  Solution: Convert n to a string, split into an array of digits, convert each element back into a number, then use reduce to sum each element. Loop this (with a one-line while statement) until n < 10.

  Notes: My original solution was 9 lines, and used a basic loop plus if/else statments to perform the above summing steps. Using the one-line "until n < 10" statement is much more elegant, and you can do the same thing in four lines.

  Also, the nature of this problem (repeating the same steps until a base case is reached) is a perfect fit for recursion. I've included a third, recursive solution in my code.  
