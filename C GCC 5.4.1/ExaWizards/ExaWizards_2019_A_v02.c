// [contests]   ExaWizards 2019
// [task]       A
// [URL]        https://atcoder.jp/contests/exawizards2019/tasks/exawizards2019_a
// [compiler]   C (GCC 5.4.1)
// [submission] https://atcoder.jp/contests/exawizards2019/submissions/4834774 : AC

#include <stdio.h>
#include <stdbool.h>

bool is_equilateral_triangle(unsigned char *A, unsigned char *B, unsigned char *C)
{
    if (*A == *B && *B == *C) { return true;  }
    else                      { return false; }
}

void exawizard2019_a(unsigned char *A, unsigned char *B, unsigned char *C)
{
    if (is_equilateral_triangle(A, B, C)) { printf("%s\n", "Yes"); }
    else                                  { printf("%s\n", "No" ); }
}

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
    exawizard2019_a(&A, &B, &C);
    
    // STEP.TRUE_END
    return 0;
}
