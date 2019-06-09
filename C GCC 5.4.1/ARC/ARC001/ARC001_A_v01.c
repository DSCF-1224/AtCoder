// [contest]    AtCoder Beginner Contest 001
// [task]       C
// [URL]        https://atcoder.jp/contests/arc001/tasks/arc001_3
// [compiler]   C (GCC 5.4.1)
// [submission] NOT submitted

#include <stdio.h>
#include <string.h>

#define num_questions_max 100
#define num_alternatives    4

int main (void)
{
	/* variables for main process */
	char val_correct_answers[num_questions_max];
	int  num_questions;
	int  val_answered[num_alternatives] = {0};

	/* support variables for main process */
	int itr;
	int rtvl_scanf;

	// STEP.01
	// read out the number of questions
	rtvl_scanf = scanf ("%d", &num_questions);

	// STEP.02
	// read out the values of the correct answer
	rtvl_scanf = scanf ("%s", val_correct_answers);

	// STEP.03
	// count up the number of correct answers
	for (itr = 0; itr < strlen (val_correct_answers); itr++)
	{
		if (val_correct_answers[itr] == '1') { val_answered[0]++; continue; }
		if (val_correct_answers[itr] == '2') { val_answered[1]++; continue; }
		if (val_correct_answers[itr] == '3') { val_answered[2]++; continue; }
		if (val_correct_answers[itr] == '4') { val_answered[3]++; continue; }
	}

	// STEP.04
	// output the result
	printf ("%d %d %d %d \n", val_answered[0], val_answered[1], val_answered[2], val_answered[3]);

	// STEP.END
	return 0;
}
