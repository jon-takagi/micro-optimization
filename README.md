### Default

The default implementation got a best run time of 0.03467s on my VM.


### Naive

My naive implementation got a best run time of .007276 seconds on my VM. It assumes that all quotes are between 3 and 5 digits, since all values in the quotes set are between 100 and 62951.

The ASCII code for 0 is 48, so interpreting a char as an ASCII value and subtracting 48 gives the int value. My code then checks the length by checking the 6th, 5th and 4th characters - if they are the null terminator, then the line is 5, 4 or 3 digits respectively.

### Optimization
