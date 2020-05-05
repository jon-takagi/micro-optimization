### Default

The default implementation got a best run time of 0.03467s on my VM.


### Naive

This naive algorithm makes no assumptions about the length of the inputs, so it has to iterate over the length of the string to find the length. It then interprets each character as an ASCII code, subtracting 48 to get a digit.

This algorithm takes about .012s on my VM. Unlike `atoi`, this algorithm doesn't work on strings with leading whitespace, which lets it avoid checking for and then stripping white space.

My algorithm is linear in each string, but iterates twice over the length.
### Optimization

#### Overall
The best run time of 1000 trials of my optimized algorithm was 4.76ms, which is about 3x faster than my naive version. 

Analyzing the data, all strings are between 100 and 62951, so 3, 4 or 5 digits. Thus, it is possible to replace both loops with a simple if /else if / else clause.

The compiler does a pretty good job with the actual math, so I left it as is. Attempting to expand it myself made it worse by roughly .0005s, probably because the compiler is able to

Using an if / else chain to determine the length of the line, rather than 3 if statements, improves performance by a smidge - about .0002 or .0003 seconds, since the other conditions are not checked.

Finally, the weird bit:
The first if/else if/else structure establishes the length, and the second uses the length to decide which calculation to do. Combining these into a single if/else if/else structure is worse - 4.5 milliseconds vs 5.8 milliseconds...

I don't really understand why this would be.
