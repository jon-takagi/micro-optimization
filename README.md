### Default

The default implementation got a best run time of 0.03467s on my VM.


### Naive

My naive implementation got a best run time of .0072s on my VM. It assumes that all quotes are between 3 and 5 digits, since all values in the quotes set are between 100 and 62951.

The ASCII code for 0 is 48, so interpreting a char as an ASCII value and subtracting 48 gives the int value. My code then checks the length by checking the 6th, 5th and 4th characters - if they are the null terminator, then the line is 5, 4 or 3 digits respectively.

### Optimization

Removing the "digits" array, and simply using the contents - `(lines[i][0]-48)` lets the compiler skip moving a bunch of values around. This gets me down to .0046s, which is 63% of the original time.

Examining the math calculation, the multiplication can be expanded, but this makes it worse by .0005s or so.
