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

// void convert_all(unsigned nlines, char *lines[], quote_t nums[])
// {
//     int length;
//     for (unsigned i = 0; i < nlines; i++) {
//         length = 0;
//         while(lines[i][length] != '\0'){
//             length++;
//         }
//         nums[i] = lines[i][0] - 48;
//         for(int l = 1; l < length; l++) {
//             nums[i] = 10 * nums[i] + lines[i][l] - 48;
//         }
//     }
// }

// Improved:

void convert_all(unsigned nlines, char *lines[], quote_t nums[])
{
    int length = 5;
    for (unsigned i = 0; i < nlines; i++) {
        if(lines[i][3] == '\0') {
            length = 3;
        } else if(lines[i][4] == '\0') {
            length = 4;
        } else {
            length = 5;
        }
        if(length == 3) {
            nums[i] = 100 * (lines[i][0] - 48) + 10 * (lines[i][1] - 48) + (lines[i][2] - 48);
        } else if(length == 4) {
            nums[i] = 1000 * (lines[i][0] - 48) + 100 * (lines[i][1] - 48) + 10 * (lines[i][2] - 48) + (lines[i][3] - 48);
        } else {
            nums[i] = 10000 * (lines[i][0] - 48) + 1000 * (lines[i][1] - 48) + 100 * (lines[i][2] - 48) + 10 * (lines[i][3] - 48) + (lines[i][4] - 48);
        }
    }
}

// worse, but why?:

// void convert_all(unsigned nlines, char *lines[], quote_t nums[])
// {
//     for (unsigned i = 0; i < nlines; i++) {
//         if(lines[i][3] == '\0') {
//             nums[i] = 100 * (lines[i][0] - 48) + 10 * (lines[i][1] - 48) + (lines[i][2] - 48);
//         } else if(lines[i][4] == '\0') {
//             nums[i] = 1000 * (lines[i][0] - 48) + 100 * (lines[i][1] - 48) + 10 * (lines[i][2] - 48) + (lines[i][3] - 48);
//         } else {
//             nums[i] = 10000 * (lines[i][0] - 48) + 1000 * (lines[i][1] - 48) + 100 * (lines[i][2] - 48) + 10 * (lines[i][3] - 48) + (lines[i][4] - 48);
//         }
//     }
// }
