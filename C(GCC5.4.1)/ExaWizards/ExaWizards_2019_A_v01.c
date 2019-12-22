// [contests]   ExaWizards 2019
// [task]       A
// [URL]        https://atcoder.jp/contests/exawizards2019/tasks/exawizards2019_a
// [compiler]   C (GCC 5.4.1)
// [submission] https://atcoder.jp/contests/exawizards2019/submissions/4788618 : AC

#include <stdio.h>


int main (void)
{
    /* variables for main process */
    unsigned char A, B, C;

    /* support variables for main process */
    int retval_scanf;

    // STEP.01
    // read out the given integers
    retval_scanf = scanf("%hhu %hhu %hhu", &A, &B, &C);

    // STEP.02
    // determine if there exists an equilateral triangle whose sides have lengths A, B and C.
    if (A == B && B == C) { printf("%s\n", "Yes"); }
    else                  { printf("%s\n", "No" ); }
    
    // STEP.TRUE_END
    return 0;
}
