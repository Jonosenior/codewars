# Codewars Problem Sets

This is a collection of my solutions to coding problems on CodeWars, which the site calls 'katas':

> In our dojo, kata are real code challenges focused on improving skill and technique. Some train programming fundamentals, while others focus on complex problem solving.

Players are ranked, with new users assigned a rating of 8 kyu, where 1 kyu is the best.

My CodeWars profile is [here](https://www.codewars.com/users/jonosenior).

As of <b>19.04.2018</b>:

* Total code challenges completed: <b>28</b>.

* Overall CodeWars rank: <b>6 kyu</b>.


## Notes on (some) solutions

### Persistent-bugger

FINALLY I get to use recursion in the wild (ie, not on a problem that I know exists to practice recursion). The problem asks to find the 'multiplicative persistence' of a number - ie, how many times you have to multiply the digits of that number together before you reach a single digit number. Since the steps of the algorithm are identical all the way down (take a number, divide it into its constituent digits, multiply those digits together, check if the result is a one-digit number, repeat), this was a perfect candidate for recursion.

I was also happy to use the #reduce method, because I tend to overuse the bulkier (but easier to understand) #each method. I'm trying to make my Ruby code more idiomatic, and this felt like a step forward.

### Calculate-string-rotation

  At first, I was thinking about this kata totally wrong. With hindsight, I can see that I was making a big conceptual mistake.

  When a letter is rotated beyond the end of the word length, I was trying to calculate exactly how many times it wrapped round, and then removing the superfluous wraps from the shift number. This method was brittle, and I think the reason why I failed the "random" tests (although they're not viewable on CodeWars). It's much more reliable to simply print the second word twice, and find the index of the first word in that second word. This way, you don't need to worry about "wrapping" around the end of the word at all.

### Number of trailing zeros of N!

  This challenge asks to find the number of trailing zeros in the factorial of a given number. For example, the factorial of 23! is 25852016738884976640000, which has four trailing zeros. The tricky part is that factorial calculations are too large to actually perform in the method - the solution needs to use a shortcut somehow.

  I researched a shortcut on maths forums (rather than working it out myself), and found one [here](http://www.purplemath.com/modules/factzero.htm). The method overview is:
    * Take the number that you've been given the factorial of.
    * Divide by 5; if you get a decimal, truncate to a whole number.
    * Divide by 52 = 25; if you get a decimal, truncate to a whole number.
    * Divide by 53 = 125; if you get a decimal, truncate to a whole number.
    * Continue with ever-higher powers of 5, until your division results in a number less than 1. Once the division is less than 1, stop.
    * Sum all the whole numbers you got in your divisions. This is the number of trailing zeroes.

  That's what I recreate in my method. I use recursion to perform the multiplication by increasing powers of five, where the base case is if the division produces a number less than one.

## 7-Kyu - Mumbling

  I refactored my solution to use the #map method (rather than #each) to make my code more idiomatic Ruby. So whereas in my original solution I created an empty answer array before iterating over the input + pushing to that answer array; in my refactored solution the answer array is set equal to the product of  #map.with_index.

## 7-Kyu - Vowel Count

  This is one of those challenges that must be much easier in Ruby - with its tailor-made iterator methods - than other languages. I didn't realise that the #count method works for strings as well as arrays, so my original solution superfluously transformed the input string into an array, then iterated over it with #count. The currently-displayed solution iterates over the input string itself, for a very short method.

## 7-Kyu - Highest and Lowest

  The challenge gives a string of numbers, and the solution should return the highest and lowest number.

  My first iteration of the solution:
    * converted the input string to an array of numbers (with '.split.map(&:to_i)').
    * defined 'high' and 'low' variables equal to the first element of the numbers array.
    * iterated with #each over the numbers array, redefining the high and low variables if the element was higher or lower.

  (A small bug I had to solve was forgetting to convert the input string to numbers before transforming into an array).

  But, this solution was much wordier than my current solution. A much more streamlined version (I found googling) is to make use of Ruby's #max and #min methods. Then you don't need to explicitly use #each to iterate over the method. This is a general principle I want to improve on: not relying on #each as an all-purpose iterator, but to use Ruby's native method to write more idiomatic code.

## 7-Kyu - Descending Order
  Challenge: Given a non-negative integer, return its digits in descending order.

  Solution: Convert the integer into an array of digits, sort it and reverse it, then convert back into an integer.

  I was happy to do this as a one-liner - it feels like I'm making progress in writing concise code & chaining methods (although I'm aware this is perhaps not the most readable code so not the best choice for using in deployment). Discovering the #map(&:to_i) tool is very useful for these challenges.

## 7-Kyu - Complementary DNA

  Challenge: Given a DNA string (eg "ATTGC"), return its complementary bases ("TAACG").

  Solution: I added the complementary relationships as key/value pairs in a hash, then iterated with #map over each character in the input string, passing it as a key to the hash to return the complementary value.

  Note: Looking at the top-rated CodeWars solutions, they made use of Ruby's #tr method, which I hadn't seen before. #tr is called on a string. From the documentation:

  > Returns a copy of str with the characters in from_str replaced by the corresponding characters in to_str. If to_str is shorter than from_str, it is padded with its last character in order to maintain the correspondence.

    > "hello".tr('el', 'ip')      #=> "hippo"

    > "hello".tr('aeiou', '*')    #=> "h*ll*"

  Using #tr allows for a much more concise solution, with no need to convert the input string to an array:
        dna.tr("ACTG", "TGAC")

## 7-Kyu - Jaden Casing Strings

  Challenge: capitalize the first letter of each word in a string.

  Solution: The solution is straightforward (convert the string to an array, iterate over each word-element to capitalize the first character, then convert back to a string).

  Notes: Taking a cue from highly-ranked solutions on CodeWars, I passed the #map method a proc argument with the neat Ruby shorthand ('&:capitalize'). This is more concise than explicitly calling .capitalize in a block, as I did in the original. I'll try to remember to use this shortcut from now on.

## 7-Kyu - Shortest Word

  Challenge: Given a string, return the length of the shortest word in that string.

  Solution: Split the string, sort that array by length, then return the length of the first element.

  Notes: The original solution described above is a one-liner, but there is a yet better way. Rather than sorting the array (unnecessary because we don't care about the lengths of elements other than the smallest), it's better to use "str.split(" ").map(&:length).min". Basically, pass #length as a proc and make use of Ruby's #min method.

## 7-Kyu - Sum the Numbers

  Challenge: Given two integers, sum the numbers that comprise the range between them.

  Solution: First, return the range of either a..b or b..a (if a is larger then the latter, otherwise the former). Then call #reduce(&:+) on the range.

## 7-Kyu - Disemvowel Trolls

  Challenge: Return a given string without its vowels.

  Solution: #gsub and /[aeiouAEIOU]/. Basically, the easiest RegEx of all time. Which is nice because I'm quite intimidated and scared of RegEx - so it's good to practice using it on an easy one.

## 7-Kyu Growth of a Population

  Challenge: Calculate how many years it will take for a town to reach a certain population, given inputs for starting population, percentage growth rate and net immigration.

  Notes: This challenge is waaay harder than other 7-Kyu challenges. I was stupidly stuck on a single failing test case for a long time - I couldn't work out why it would pass every test except one. But I wasn't thinking clearly about edge cases - what happens if the population EQUALS (not exceeds) the given population threshold. So to pass the test I needed to change "sum > p" to "sum >= p". A very basic oversight, but good to keep in mind for the future.
