# Codewars Problem Sets

This is a collection of my solutions to coding problems on CodeWars (the site calls them 'katas').

My CodeWars profile is [here](https://www.codewars.com/users/jonosenior).

As of 12.04.2018:
Total code challenges completed: 20.
Current Codewars rank: 6 kyu.


## Notes on solutions

### Persistent-bugger

FINALLY I get to use recursion in the wild (ie, not on a problem that I know exists to practice recursion). The problem asks to find the 'multiplicative persistence' of a number - ie, how many times you have to multiply the digits of that number together before you reach a single digit number. Since the steps of the algorithm are identical all the way down (take a number, divide it into its constituent digits, multiply those digits together, check if the result is a one-digit number, repeat), this was a perfect candidate for recursion.

I was also happy to use the #reduce method, because I tend to overuse the bulkier (but easier to understand) #each method. I'm trying to make my Ruby code more idiomatic, and this felt like a step forward.
