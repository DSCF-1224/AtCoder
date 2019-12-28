// contest  : ABC 086
// task     : C
// URL      : https://atcoder.jp/contests/abc086/tasks/arc089_a
// compiler : C (GCC 5.4.1)
// status   : https://atcoder.jp/contests/abc086/submissions/9164826: AC

#include <stdio.h>
#include <stdlib.h>
#include <stdbool.h>

#define num_points_max 100000

typedef struct
{
	int time;
	int rcdx;
	int rcdy;
} coordinate;

typedef struct
{
	int        num_points;
	coordinate way_point[num_points_max + 1];
} abc086c_t;

bool IsPossible (const abc086c_t * const given_data)
{
	// local variables for this function
	coordinate displacement;
	int        distance;

	for (int iter = 1; iter <= (*given_data).num_points; ++iter)
	{
		displacement.time = (*given_data).way_point[iter].time - (*given_data).way_point[iter - 1].time;
		displacement.rcdx = (*given_data).way_point[iter].rcdx - (*given_data).way_point[iter - 1].rcdx;
		displacement.rcdy = (*given_data).way_point[iter].rcdy - (*given_data).way_point[iter - 1].rcdy;

		distance = abs(displacement.rcdx) + abs(displacement.rcdy);

		if (distance > displacement.time)
		{
			return false;
		}
		else if (distance % 2 != displacement.time % 2)
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

void ABC086C (const abc086c_t * const given_data)
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

	given_data.way_point[0].time = 0;
	given_data.way_point[0].rcdx = 0;
	given_data.way_point[0].rcdy = 0;

	for (int iter = 1; iter <= num_points_max; ++iter)
	{
		retval_scanf =
			scanf(
				"%d %d %d",
				&given_data.way_point[iter].time,
				&given_data.way_point[iter].rcdx,
				&given_data.way_point[iter].rcdy
			);
	}

	// STEP.02
	// calculate & output the answer
	ABC086C(& given_data);

	// STEP.END
	return EXIT_SUCCESS;
}

/* EOF */
