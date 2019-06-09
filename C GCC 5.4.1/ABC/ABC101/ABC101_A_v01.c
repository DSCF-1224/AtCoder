// [contest]  ABC 101
// [task]     A
// [URL]      https://atcoder.jp/contests/abc101/tasks/abc101_a
// [compiler] C (GCC 5.4.1)
// [status]   https://atcoder.jp/contests/abc101/submissions/5829377 : AC, with compile errors
// [status]   https://atcoder.jp/contests/abc101/submissions/5829547 : AC

#include <stdio.h>

#define len_string_max 4

int calculate_points (char data_string[len_string_max])
{
    // variables for `calculate_points`
    int points;

    // STEP.01
    // initialize the points
    points = 0;

    // STEP.02
    // calculate the points using given string
    for (size_t itr = 0; itr < len_string_max; itr++)
    {
        if (data_string[itr] == '+') points += 1;
        if (data_string[itr] == '-') points -= 1;
    }

    // STEP.END
    return points;
}

int main (void)
{
    // variables for `main`
    char given_string[len_string_max];
    int  rtvl_scanf;

    // STEP.01
    // read out the given string
    rtvl_scanf = scanf("%s", given_string);

    // STEP.02
    // calcualte & output the points
    printf("%d\n", calculate_points(given_string));

    // STEP.END
    return 0;
}