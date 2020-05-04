/*
 * Trivial implementation of converter function.
 * You may override this file or create your own.
 */
#include "converter.h"
#include <iostream>
#include <stdlib.h>
#include <emmintrin.h>
// EXAMPLE

// void convert_all(unsigned nlines, char *lines[], quote_t nums[])
// {
//   for (unsigned i = 0; i < nlines; i++) {
//     nums[i] = atoi(lines[i]);
//   }
// }

// NAIVE

void convert_all(unsigned nlines, char *lines[], quote_t nums[])
{
    int digits[5] = {0,0,0,0,0};
    int length = 5;
    for (unsigned i = 0; i < nlines; i++) {
        if(lines[i][5] == '\0') {
            length = 5;
        }
        if(lines[i][4] == '\0') {
            length = 4;
        }
        digits[4] = lines[i][4] - 48;
        if(lines[i][3] == '\0') {
            length = 3;
        }
        digits[3] = lines[i][3] - 48;
        digits[2] = lines[i][2] - 48;
        digits[1] = lines[i][1] - 48;
        digits[0] = lines[i][0] - 48;
        if(length == 3) {
            nums[i] = 100 * digits[0] + 10 * digits[1] + digits[2];
        } else if(length == 4) {
            nums[i] = 1000 * digits[0] + 100 * digits[1] + 10 * digits[2] + digits[3];
        } else {
            nums[i] = 10000 * digits[0] + 1000 * digits[1] + 100 * digits[2] + 10 * digits[3] + digits[4];
        }
    }
}

// Improved:

// void convert_all(unsigned nlines, char *lines[], quote_t nums[])
// {
//     int length = 5;
//     for (unsigned i = 0; i < nlines; i++) {
//         if(lines[i][3] == '\0') {
//             length = 3;
//         } else if(lines[i][4] == '\0') {
//             length = 4;
//         } else {
//             length = 5;
//         }
//         if(length == 3) {
//             nums[i] = 100 * (lines[i][0] - 48) + 10 * (lines[i][1] - 48) + (lines[i][2] - 48);
//         } else if(length == 4) {
//             nums[i] = 1000 * (lines[i][0] - 48) + 100 * (lines[i][1] - 48) + 10 * (lines[i][2] - 48) + (lines[i][3] - 48);
//         } else {
//             nums[i] = 10000 * (lines[i][0] - 48) + 1000 * (lines[i][1] - 48) + 100 * (lines[i][2] - 48) + 10 * (lines[i][3] - 48) + (lines[i][4] - 48);
//         }
//     }
// }
