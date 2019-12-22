// [contest]  ABC 101
// [task]     A
// [URL]      https://atcoder.jp/contests/abc101/tasks/abc101_a
// [compiler] C (GCC 5.4.1)
// [status]   https://atcoder.jp/contests/abc101/submissions/5829514 : AC, with compile errors
//            https://atcoder.jp/contests/abc101/submissions/5829534 : AC, with compile errors
//            https://atcoder.jp/contests/abc101/submissions/5829653 : AC

#include <stdio.h>

// constants for this code
#define len_string_max 4
#define sym_pls1       '+'
#define sym_mns1       '-'

int calculate_points (char* data_string)
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
        if (data_string[itr] == sym_pls1) points++;
        if (data_string[itr] == sym_mns1) points--;
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