// contest  : ABC 086
// task     : C
// URL      : https://atcoder.jp/contests/abc086/tasks/arc089_a
//          : https://atcoder.jp/contests/arc089/tasks/arc089_a
// compiler : C (GCC 5.4.1)
// status   : https://atcoder.jp/contests/abc086/submissions/9150348 : AC

#include <stdio.h>
#include <stdlib.h>
#include <stdbool.h>

#define num_points_max 100000

typedef struct
{
	int num_points;
	int time[num_points_max + 1];
	int rcdx[num_points_max + 1];
	int rcdy[num_points_max + 1];
} abc086c_t;

bool IsPossible (const abc086c_t * given_data)
{
	// local variables for this function
	int available_time;
	int displacement_rcdx;
	int displacement_rcdy;
	int displacement_sum;

	for (int iter = 1; iter <= (*given_data).num_points; ++iter)
	{
		available_time    = (*given_data).time[iter] - (*given_data).time[iter - 1];
		displacement_rcdx = (*given_data).rcdx[iter] - (*given_data).rcdx[iter - 1];
		displacement_rcdy = (*given_data).rcdy[iter] - (*given_data).rcdy[iter - 1];

		displacement_sum = abs(displacement_rcdx) + abs(displacement_rcdy);

		if (displacement_sum > available_time)
		{
			return false;
		}
		else if (displacement_sum % 2 != available_time % 2)
		{
			return false;
		}
		else
		{
			continue;
		}
	}

	return true;
}

void ABC086C (const abc086c_t * given_data)
{
	if   ( IsPossible(given_data) ) printf( "Yes\n" );
	else                            printf(  "No\n" );
}

int main (void)
{
	// variables for `main`
	abc086c_t given_data;
	int       retval_scanf;

	// STEP.01
	// read out the given data
	retval_scanf = scanf("%d", &given_data.num_points);

	given_data.time[0] = 0;
	given_data.rcdx[0] = 0;
	given_data.rcdy[0] = 0;

	for (int iter = 1; iter <= num_points_max; ++iter)
	{
		retval_scanf =
			scanf(
				"%d %d %d",
				&given_data.time[iter],
				&given_data.rcdx[iter],
				&given_data.rcdy[iter]
			);
	}

	// STEP.02
	// calculate & output the answer
	ABC086C(& given_data);

	// STEP.END
	return EXIT_SUCCESS;
}

/* EOF */
