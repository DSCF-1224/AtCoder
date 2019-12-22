// [contest]  ABC 133
// [task]     B
// [URL]      https://atcoder.jp/contests/abc133/tasks/abc133_b
// [compiler] C (GCC 5.4.1)
// [status]   https://atcoder.jp/contests/abc133/submissions/6538479 : AC

#include <stdbool.h>
#include <stdio.h>
#include <stdlib.h>

// constants for main process
#define num_points_max    10
#define val_dimension_max 10

bool is_GoodDist (signed int val_dist)
{
	for (signed int itr = 0; itr <= val_dist; itr++)
	{
		if (itr * itr == val_dist) { return true; }
	}

	return false;
}

signed int calculate_distance2 (signed int val_dimension, signed int point_origin[], signed int point_target[])
{
	// local variables for this function
	signed int difference;

	// return value of this function
	signed int distance2;

	distance2 = 0;

	for (signed int itr = 0; itr < val_dimension; itr++)
	{
		difference  = point_target[itr] - point_origin[itr];
		distance2  += difference * difference;
	}

	return distance2;
}

signed int calculate_num_GoodDist (signed int num_points, signed int val_dimension, signed int coordinate[num_points_max][val_dimension_max])
{
	// return value of this function
	signed int num_GoodDist;

	// STEP.01
	// initialize the return value
	num_GoodDist = (signed int)0;

	for (signed int itr_po = 0;          itr_po < num_points; itr_po++) {//
	for (signed int itr_pt = itr_po + 1; itr_pt < num_points; itr_pt++) {//
		if ( is_GoodDist( calculate_distance2(val_dimension, coordinate[itr_po], coordinate[itr_pt]) ) )
		{ num_GoodDist += (signed int)1; }
	} }

	// STEP.END
	return num_GoodDist;
}

int main (void)
{

	// variables for main process
	signed int N; // number of points
	signed int D; // dimension of the given data

	// support variables for main process
	signed int rtvl; // store the return value of `scanf`

	// arrays for main process
	signed int X[num_points_max][val_dimension_max]; // data of coordinate

	// STEP.01
	// read out the given data
	rtvl = scanf("%d %d", &N, &D);

	for (signed int itr_p = 0; itr_p < N; itr_p++) {//
	for (signed int itr_d = 0; itr_d < D; itr_d++) {//
		rtvl = scanf("%d", &X[itr_p][itr_d]);
	} }

	// STEP.02
	// output the answer of this task
	printf("%d\n", calculate_num_GoodDist(N, D, X));

	// STEP.END
	return EXIT_SUCCESS;
}

/* EOF */
