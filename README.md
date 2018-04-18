# Codewars Problem Sets

This is a collection of my solutions to coding problems on CodeWars (the site calls them 'katas').

My CodeWars profile is [here](https://www.codewars.com/users/jonosenior).

As of 12.04.2018:

Total code challenges completed: 20.

Overall CodeWars rank: 6 kyu.


## Notes on solutions

### Persistent-bugger

FINALLY I get to use recursion in the wild (ie, not on a problem that I know exists to practice recursion). The problem asks to find the 'multiplicative persistence' of a number - ie, how many times you have to multiply the digits of that number together before you reach a single digit number. Since the steps of the algorithm are identical all the way down (take a number, divide it into its constituent digits, multiply those digits together, check if the result is a one-digit number, repeat), this was a perfect candidate for recursion.

I was also happy to use the #reduce method, because I tend to overuse the bulkier (but easier to understand) #each method. I'm trying to make my Ruby code more idiomatic, and this felt like a step forward.

### Calculate-string-rotation

  At first, I was thinking about this kata totally wrong. With hindsight, I can see that I was making a big conceptual mistake.

  When a letter is rotated beyond the end of the word length, I was trying to calculate exactly how many times it wrapped round, and then removing the superfluous wraps from the shift number. This method was brittle, and I think the reason why I failed the "random" tests (although they're not viewable on CodeWars). It's much more reliable to simply print the second word twice, and find the index of the first word in that second word. This way, you don't need to worry about "wrapping" around the end of the word at all.

### Number of trailing zeros of N!

  This challenge asks to find the number of trailing zeros in the factorial of a given number. For example, the factorial of 23! is 25852016738884976640000, which has four trailing zeros. The tricky part is that factorial calculations are too large to actually perform in the method - the answer needs to find a shortcut somehow.

  I researched a shortcut on maths forums (rather than working it out myself), and found one [here](http://www.purplemath.com/modules/factzero.htm). The method overview is:
    - Take the number that you've been given the factorial of.
    - Divide by 5; if you get a decimal, truncate to a whole number.
    - Divide by 52 = 25; if you get a decimal, truncate to a whole number.
    - Divide by 53 = 125; if you get a decimal, truncate to a whole number.
    - Continue with ever-higher powers of 5, until your division results in a number less than 1. Once the division is less than 1, stop.
    - Sum all the whole numbers you got in your divisions. This is the number of trailing zeroes.

  That's what I recreate in my method. I use recursion to perform the multiplication by increasing powers of five, where the base case is if the division produces a number less than one. 
