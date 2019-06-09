// [contest]  ABC 101 / ARC 099
// [task]     C
// [URL]      https://atcoder.jp/contests/abc101/tasks/arc099_a
// [compiler] C (GCC 5.4.1)
// [status]   https://atcoder.jp/contests/abc101/submissions/5831932 : WA
//            https://atcoder.jp/contests/abc101/submissions/5832072 : AC

#include <stdio.h>
#include <math.h>

int calculate_min_num_operations (int len_sequence, int num_elements_replacing)
{
    return ceil( ( (double)(len_sequence - (int)1) ) / ( (double)(num_elements_replacing - (int)1) ) );
}

int main (void)
{
    // variables for main process
    int len_sequence;
    int num_elements_replacing;
    int rtvl_scanf;

    // STEP.01
    // read out ...
    // 1. the length of the given sequence
    // 2. the number of elements to replace at once
    rtvl_scanf = scanf("%d %d", &len_sequence, &num_elements_replacing);

    // STEP.02
    // calculate & output minumum value of the number of operations that can be realized in a given sequence
    printf("%d\n", calculate_min_num_operations (len_sequence, num_elements_replacing));

    // STEP.END
    return 0;
}
