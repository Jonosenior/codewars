# Notes on 6-Kyu Challenges

## Decode the Morse Code

  Challenge: Given a string of morse code, return its translation. Letters are seperated by a single space; words by three spaces. Leading and trailing whitespace should be left out.

  Solution: Save a hash with morse code as key/val pairs. Remove the extraneous whitespace from the string with #strip, then split the array into constituent words with #split('   '). Iterate over each word (subarray), and then convert each character with the morse code hash. Join the characters together, and then the words (sub-arrays) together with a space. Voila!

  Notes: I found the trickiest part of this was dealing with the whitespace - how to differentiate between the single space for letters and the triple space for words. At first I tried to split the whole string into its characters, keeping the triple spaces as markers of a new word. But this was too hard: it's much better to return a 2d-array where each subarray is a word. To get this, you need to first split by triple space character: split('   ').

  To remove leading and trailing whitespace, I used gsub and the following regex: /(^\s+)|(\s+$)/. There's actually an easier way in Ruby: use the #strip method.
