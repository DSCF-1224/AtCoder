// AtCoder Beginner Contest 006 C
// [URL]      https://atcoder.jp/contests/abc006/tasks/abc006_3
// [compiler] C (GCC 5.4.1)
// 
#include <stdio.h>

#define num_legs_adult   2
#define num_legs_senior  3
#define num_legs_baby    4
#define val_error       -1

void find_structure( unsigned population, unsigned num_legs_total )
{
	/* variables for this function */
	unsigned itr_adult, itr_senior, itr_baby;

	// STEP.01
	for(itr_adult = 0; itr_adult <= population; itr_adult++)
	{
		for(itr_senior = 0; itr_senior <= population-itr_adult; itr_senior++)
		{
			itr_baby = population - ( itr_adult+itr_senior );
			if( itr_baby >= 0 && itr_adult*num_legs_adult + itr_senior*num_legs_senior + itr_baby*num_legs_baby == num_legs_total )
			{
				printf( "%d %d %d\n", itr_adult, itr_senior, itr_baby );
				return; // STEP.TRUE_END
			}
		}
	}
	

	// STEP.END
	printf( "%d %d %d\n", val_error, val_error, val_error );
	return;
}

int main (void)
{
	/* variables for main process */
	unsigned population, num_legs_total;

	// STEP.01
	// read the target number
	scanf( "%d %d", &population, &num_legs_total );

	// STEP.02
	// output the mod
	find_structure( population, num_legs_total );

	// STEP.TRUE_END
	return 0;
}
