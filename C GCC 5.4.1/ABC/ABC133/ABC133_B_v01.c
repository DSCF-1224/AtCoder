// [contest]  ABC 133
// [task]     B
// [URL]      https://atcoder.jp/contests/abc133/tasks/abc133_b
// [compiler] C (GCC 5.4.1)
// [status]   NOT Submitted

#include <stdbool.h>
#include <stdio.h>

bool is_GoodDist (int val_dist)
{
	bool flag;

	flag = false;

	for (int itr = 0; itr <= val_dist; itr++)
	{
		if (itr * itr == val_dist) {
			flag = true;
			break;
		}
	}

	return flag;
}

int calculate_distance2 (int val_dimension, int point_origin[], int point_target[])
{
	// local variables for this function
	int difference;

	// return value of this function
	int distance2;

	distance2 = 0;

	for (int itr = 0; itr< val_dimension; itr++)
	{
		difference  = point_target[itr] - point_origin[itr];
		distance2  += difference * difference;
	}

	return distance2;
}

int calculate_num_GoodDist (int num_points, int val_dimension, int **coordinate)
{
	for (int itr_p = 0; itr_p < num_points;    itr_p++) {
	for (int itr_d = 0; itr_d < val_dimension; itr_d++) {
		printf(" %d", coordinate[itr_p][itr_d]);
	}
		printf("\n");
	}
}

// constants for main process
#define num_points_max    10
#define val_dimension_max 10

int main (void)
{

	// variables for main process
	int N; // number of points
	int D; // dimension of the given data

	// support variables for main process
	int rtvl_scanf; // store the return value of `scanf`

	// arrays for main process
	int X[num_points_max][val_dimension_max]; // data of coordinate

	// STEP.01
	// read out the given data
	rtvl_scanf = scanf("%d %d", &N, &D);

	for (int itr_p = 0; itr_p < N; itr_p++) {//
	for (int itr_d = 0; itr_d < D; itr_d++) {//
		rtvl_scanf = scanf("%d", &X[itr_p][itr_d]);
	} }

	// STEP.02
	// output the answer of this task
	printf("%d\n", calculate_num_GoodDist(N, D, X));

	// STEP.END
	return 0;
}

/* EOF */
