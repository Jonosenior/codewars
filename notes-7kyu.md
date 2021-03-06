# Notes on 7-Kyu Challenges

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

## 7-Kyu - Find the Next Perfect Square

  Challenge: Given an integer, return the next-highest perfect square. If the given number isn't itself a perfect square, return -1.

  Solution: My first idea was a basic loop that adds one until the next square is found (test for square uses "num % 1 == 0").

  Notes: My solution works but is definitely not the most efficient search method. Reading the best-rated CodeWars solutions, I realised a much better method is to find the square root of the given number, add one then find the square. Duh!

## 7-Kyu - Isograms

  Challenge: Given a string, return true if that true contains no repeated characters.

  Original solution: downcase and split the string; iterate length.times and pop the last character. Check if the remaining array contains this last character - if so return false.

  Refactored solution: Make use of Ruby's #chars and #uniq methods. #chars is called on a string and returns an array with each character of the string as a separate element. #uniq returns a new array by removing duplicate values from self. So you just need to compare the two: "string.downcase.chars.uniq == string.downcase.chars".

## 7-Kyu - Is this a triangle?

  Challenge: Given the lengths of 3 sides, return true if they could build a triangle. (From wikipedia: "the triangle inequality states that for any triangle, the sum of the lengths of any two sides must be greater than or equal to the length of the remaining side").

  Original solution: Use sets of logic gates to manually go through each possible sum calculation (ie, return false if a + b < c, return false if...). BUT, having the best-rated solutions feature a better version of this. Connect all the logic in a single line with && operators:
  ```
    a + b > c && a + c > b && b + c > a
  ```

  But there's an even better way. Add all three sides to an array, sort it, then see if arr[0] + arr[1] > arr[2]. Since the smallest sides come first, if their sum is greater than the third side, then the other two combinations will be as well. So you only need to do one calculation, not three. Neat!

## 7-Kyu - Credit Card Mask

  Challenge: Change all but the last four characters of a given string to "#".

  Solution: Pop the last four characters and save them to a variable. Then use #map to iterate over an array of the remaining string, converting each character to "#", and add the last four characters to the end.

## 7-Kyu - Printer Errors

  Challenge: Given a string of letters representing printer data, where the letters a-m are correct and n-z are errors, determine the ratio of incorrect:total_letters.

  Solution: use #scan(/[n-z]/).length to count the number of errors. Other possibilities would be to use #count('n-z') or #gsub(/[n-z]/,"").

## 7-Kyu - RegEx Validate PIN code

  Challenge: Return true if method is passed a valid PIN code (only digits; can be either four or six digits long), otherwise false.

  Solution: A fabulous RegEx one-liner:
  ```
  !!/^\d{4}$|^\d{6}$/.match(pin)
  ```
  Notes: This was an extremely useful challenge to solve because researching a solution taught me valuable RegEx strategies.

  The important parts to the solution are:
  * #match is called on a RegEx object and returns a Match Object if it matches the string passed as an argument (here, pin).
  * The "!!" at the beginning turns the MatchObject into a Boolean.
  * No square brackets. Square brackets enclose a single character.  
  * "^" signifies the start of a line; "$" the end of a line.
  * '\d' matches a digit, {4} means four of those digits in a row.
  * The | in the middle means or - the whole thing matches either four or six consecutive digits (but not five).

## 7-Kyu - Row Sum of Odd Numbers

  Challenge: Given the triangle of consecutive odd numbers:

               1
            3     5
         7     9    11
     13    15    17    19
  21    23    25    27    29

  Calculate the row sums of this triangle from the row index (starting at index 1) e.g.:

  row_sum_odd_numbers(1); # 1
  row_sum_odd_numbers(2); # 3 + 5 = 8

  Solution: My shortest solution so far. Drawing it out on paper it's quickly obvious that a shortcut to finding the sum of row n is to calculate n to the power of 3: n**3. (That's the whole solution!).

## 7-Kyu - Remove the Minimum

  Challenge: Remove the smallest element from an array of numbers, without changing the order of the array.

  Solution: Find the index of the smallest element (with array.min), and #delete_at this index. To deal with empty arrays, the solution needs a "return [] if array.empty?" line - otherwise empty arrays will return an error.

## 7-Kyu - Binary Addition

  Challenge: Given two integers, return their sum in binary.

  Solution: Super easy with Ruby's #to_s(base) method:
  ```
  (a+b).to_s(2)
  ```
  Research for this solution was useful as I need to get my head around binary at some point.

## 7-Kyu - Binary Array to Number

  Challenge: Given an array representing a binary number, convert it to an integer.

  Solution: My previous challenge asked me to convert integer to binary - for which I used Ruby's #to_s(base) method (easy peasy). This challenge asks for a method that converts the other way - binary to integer. Again there's a super easy Ruby method: #to_i(base).

## 7-Kyu - Sum of the First Nth Term of Series

  Challenge: Write a function which returns the sum of the following series up to the nth parameter:

    Series: 1 + 1/4 + 1/7 + 1/10 + 1/13 + 1/16 +...

  Solution: Create an array of the range 1 to n. Use map to perform the following calculation on each element: 1/(n*3) - 2. The outputted array produces the requested series up to the nth element - convert to a decimal with #to_f. Then use #reduce(&:+) to add each element in the array.

  Notes: One tricky part of this problem is always outputting a number with two decimal points - Ruby's #round method won't do that automatically if the answer is 1.0, for example. I discovered the #sprintf('%.2f', num) method to get round this - the first argument is the desired formatting (here, 2 decimal points), the second argument is the number you want to convert. The output is a string.

  The second tricky part was an edge case - what if the method is passed zero? This broke the #sprintf first iteration of my solution. The workaround is to include an "or 0" line in the second argument for #sprintf - so it never gets passed nil.
