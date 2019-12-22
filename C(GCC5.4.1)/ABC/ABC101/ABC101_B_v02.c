// [contest]  ABC 101
// [task]     B
// [URL]      https://atcoder.jp/contests/abc101/tasks/abc101_b
// [compiler] C (GCC 5.4.1)
// [status]   https://atcoder.jp/contests/abc101/submissions/5831572 : AC

#include <stdio.h>
#include <stdbool.h>

int calculate_digit_sum (int target, int* digit_sum)
{
    // STEP.01
    // initialize the variable to store the digit sum
    *digit_sum = (int)0;

    // STEP.03
    // calculate the digit sum
    while (target > (int)0)
    {
        *digit_sum += target % (int)10;
        target     /= (int)10;
    }

    // STEP.END
    // declare the return value of this function
    return 0;
}

bool is_multiple (int target, int base)
{
    if (target % base == (int)0) { return true;  }
    else                         { return false; }
}

int main (void)
{
    // variables for `main`
    int int_given;
    int digit_sum;
    int rtvl_scanf;

    // STEP.01
    // read out the given string
    rtvl_scanf = scanf("%d", &int_given);

    // STEP.02
    // calculate the digit sum of the given integer
    calculate_digit_sum(int_given, &digit_sum);

    // STEP.03
    // output whether the digit sum of given integer is the multiple of the given integer or not
    if ( is_multiple( int_given, digit_sum ) )
    { printf("%s\n", "Yes"); }
    else
    { printf("%s\n", "No"); }

    // STEP.END
    return 0;
}