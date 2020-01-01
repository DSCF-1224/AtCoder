// [contest]    AtCoder Beginner Contest 001
// [task]       D
// [URL]        https://atcoder.jp/contests/abc001/tasks/abc001_4
// [compiler]   C (GCC 5.4.1)
// [submission] https://atcoder.jp/contests/abc001/submissions/9265231 : AC

#include <stdbool.h>
#include <stdio.h>
#include <stdlib.h>

#define NUM_PERIODS_MAX 30000

typedef struct
{
	short int start;
	short int stop;
} period;

typedef struct
{
	int    num_periods;
	period period[NUM_PERIODS_MAX];
} abc001d_t;



void  get_test_data    (abc001d_t * const test_data);
short round_time_down  (const short const * time);
short round_time_up    (const short const * time);
void  sort_periods     (abc001d_t * const test_data);
bool  compare_period   (const period const * fst, const period const * snd);
void  abc001d_answerer (const abc001d_t const * test_data);
void  printf_period    (const period const * data);


int main (void)
{
	// variables for main process
	abc001d_t test_data;

	// STEP.01
	// read out the test data
	get_test_data( &test_data );

	// STEP.02
	// sort the rainy periods
	sort_periods( &test_data );

	// STEP.03
	// output the answer of this task
	abc001d_answerer( &test_data );

	// STEP.END
	return EXIT_SUCCESS;
}



void get_test_data (abc001d_t * const test_data)
{
	// local variables for this function
	period read_buffer;

	// support local variables for this function
	int rtvl_scanf;

	// STEP.01
	// get the number of rainy periods
	rtvl_scanf = scanf( "%d", &(*test_data).num_periods );

	// STEP.02
	// get the start / stop of rainy periods
	for (int iter = 0; iter < (*test_data).num_periods; ++iter)
	{
		rtvl_scanf = scanf( "%d-%d", &read_buffer.start, &read_buffer.stop );

		(*test_data).period[iter].start = round_time_down( &read_buffer.start );
		(*test_data).period[iter].stop  = round_time_up  ( &read_buffer.stop  );
	}

	// STEP.END
	return;
}



short round_time_down (const short const * time)
{
	// local variable for this function
	short minute01;

	minute01 = *time % 10;

	if      (minute01 == 0 || minute01 == 5) { return *time;                }
	else if (minute01 <  5 )                 { return *time - minute01;     }
	else                                     { return *time - minute01 + 5; }
}



short round_time_up (const short const * time)
{
	// local variable for this function
	short minute01;
	short minute10;

	minute01 = *time % 10;

	if      (minute01 == 0 || minute01 == 5) { return *time;                }
	else if (minute01 <  5 )                 { return *time - minute01 + 5; }

	minute10 = *time % 100 - minute01;

	if   (minute10 < 41) { return *time - minute01            +  10; }
	else                 { return *time - minute01 - minute10 + 100; }
}



void sort_periods (abc001d_t * const test_data)
{
	for (int iter_trgt = 1; iter_trgt < (*test_data).num_periods; ++iter_trgt)
	{
		int    iter_elem = iter_trgt - 1;
		period buffer    = (*test_data).period[iter_trgt];

		while ( iter_elem >= 0 )
		{
			(*test_data).period[iter_elem + 1] = (*test_data).period[iter_elem];
			
			if ( (*test_data).period[iter_elem].start < buffer.start ) break;

			--iter_elem;
		}

		(*test_data).period[iter_elem + 1] = buffer;
	}
}



bool compare_period (const period const * fst, const period const * snd)
{
	// local variables for this function
	bool stat;

	stat = ( (*fst).start > (*snd).start );

	if ( stat )
	{
		return true;
	}

	stat = ( (*fst).start < (*snd).start );

	if ( stat )
	{
		return false;
	}
	else
	{
		return ( (*fst).stop > (*snd).stop );
	}
}



void abc001d_answerer (const abc001d_t const * test_data)
{
	period period_print;

	period_print = (*test_data).period[0];

	for (int iter = 1; iter < (*test_data).num_periods; ++iter)
	{
		if ( period_print.stop < (*test_data).period[iter].start )
		{
			printf_period( &period_print );

			period_print = (*test_data).period[iter];
		}
		else if ( period_print.stop < (*test_data).period[iter].stop )
		{
			period_print.stop = (*test_data).period[iter].stop;
		}
		else
		{
			continue;
		}
	}

	printf_period( &period_print );
}



void printf_period (const period const * data)
{
	printf( "%4.4d-%4.4d\n", (*data).start, (*data).stop );
}

/* EOF */
