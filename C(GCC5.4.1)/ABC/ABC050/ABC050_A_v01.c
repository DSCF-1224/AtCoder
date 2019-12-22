// contest  : ABC 050
// task     : A
// URL      : https://atcoder.jp/contests/abc050/tasks/abc050_a
// compiler : C (GCC 5.4.1)
// status   : NOT 1Submitted

#include <stdbool.h>
#include <stdio.h>
#include <stdlib.h>

void task_A (int * const A, int * const B, char * const op) {};

int main (void)
{
	// variables for `main`
	int  A;
	int  B;
	char op;

	// variables for `main`
	int retval_scanf;

	// STEP.01
	// read out the given data
	retval_scanf = scanf("%d %s %d", &A, &op, &B);

	// STEP.02
	// calculate & output the points
	task_A(&A, &B, &op);

	// STEP.END
	return EXIT_SUCCESS;
}

void task_A (int * const A, int * const B, char * const op)
{
	if      (*op == '+') { print("%d\n", A + B); }
	else if (*op == '-') { print("%d\n", A - B); }
}

/* EOF */
