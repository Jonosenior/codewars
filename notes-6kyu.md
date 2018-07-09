# Notes on 6-Kyu Challenges

## Dubstep

  Challenge: Given a string of something like "AWUBWUBBWUBCWUBWUB", return the characters which =/= "WUB" (removing all leading and trailing whitespace, and returning only single spaces).

  Solution: Straightforward series of steps, each using gsub and regex: 1) Replace the "WUB"s with a single space, 2) Replace multiple spaces with single spaces 3) Remove trailing and heading spaces.

  Notes: After having trouble working out why CodeWars was rejecting my original solution, I used Minitest to write my own test suite. This was good practice - I've previously used Minitest only with Rails - and I'll keep using it on future challenges.

  I was sure that my solution was verbose, and sure enough the top-rated solution was much simpler than mine:

  ```ruby
  def song_decoder(song)
    song.gsub(/(WUB)+/, ' ').strip
  end
  ```
  This is a much more elegant use of gsub and Regex: 1) find any instance of "WUB", use "+" to match multiple, and replace with a space, then 2) Use Ruby's strip method to remove any leading or trailing whitespace. 


## Tribonacci-sequence
  Challenge: Like the fibonacci sequence, but summing the previous 3 numbers in a sequence, rather than just 2. Given an array of 3 numbers (the 'signature') and an integer n, return n-digits of the tribonnaci sequence, starting with the signature.

  Solution: Straightforward. Sum the last 3 digits of the signature, and push the sum to the end of the signature. Repeat n-3 times (because 3 digits are already provided in the signature).

  Notes: I thought capturing edge cases (eg n is less than 3, or zero) would be harder, but with Ruby's #first(x) method, you can simply return n digits of the signature with signature.first(n). Very neat.


## Stop-gninnips-my-sdrow.rb

  Challenge: Given a string, return that string but reverse all words longer than 4 characters.

  Solution: Pretty straightforward one-liner. Split the string on spaces, use #map to return each word if it's less than 5 chars, otherwise return the reverse of the word, then join the whole thing back together.

## Playing-with-digits
  Challenge: Given a positive integer n written as abcd... (a, b, c, d... being digits) and a positive integer p we want to find a positive integer k, if it exists, such as the sum of the digits of n taken to the successive powers of p is equal to k * n.

  Solution: For each digit of n, find the power of the digit to p, then add this to the overall sum and iterate p by one. Then, divide the sum total by n and return this if it's an integer - if not return -1.

  Notes: I assumed this problem would use #reduce, but I couldn't work out how to iterate an external variable (p) AND add to the sum, so I just used #each instead.



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

## Persistent-bugger

  FINALLY I get to use recursion in the wild (ie, not on a problem that I know exists to practice recursion). The problem asks to find the 'multiplicative persistence' of a number - ie, how many times you have to multiply the digits of that number together before you reach a single digit number. Since the steps of the algorithm are identical all the way down (take a number, divide it into its constituent digits, multiply those digits together, check if the result is a one-digit number, repeat), this was a perfect candidate for recursion.

  I was also happy to use the #reduce method, because I tend to overuse the bulkier (but easier to understand) #each method. I'm trying to make my Ruby code more idiomatic, and this felt like a step forward.

## Calculate-string-rotation

    At first, I was thinking about this kata totally wrong. With hindsight, I can see that I was making a big conceptual mistake.

    When a letter is rotated beyond the end of the word length, I was trying to calculate exactly how many times it wrapped round, and then removing the superfluous wraps from the shift number. This method was brittle, and I think the reason why I failed the "random" tests (although they're not viewable on CodeWars). It's much more reliable to simply print the second word twice, and find the index of the first word in that second word. This way, you don't need to worry about "wrapping" around the end of the word at all.
