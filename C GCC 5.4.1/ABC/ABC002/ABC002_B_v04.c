// AtCoder Beginner Contest 002 B
// [URL]        https://atcoder.jp/contests/abc002/tasks/abc002_2
// [compiler]   C (GCC 5.4.1)
// [submission] https://atcoder.jp/contests/abc002/submissions/4607211 : AC
// 
// [compile error] nothing

#include <stdio.h>
#include <stdbool.h>
#include <string.h>

#define max_len_target_string 30

bool isVowel (char *target)
{
	if ( *target == 'a' || *target == 'i' || *target == 'u' || *target == 'e' || *target == 'o' ) { return true; }
	else { return false; }
}

int main (void)
{
	/* variables for main process */
	char buf_target_string[max_len_target_string];
	int  buf_rtvl_int;
	int  itr_elem;

	// STEP.01
	// read out the target integers
	buf_rtvl_int = scanf ("%s", buf_target_string);

	// STEP.02
	// output the read string without designated characters
	for (itr_elem = 0; itr_elem < strlen (buf_target_string); itr_elem++)
	{
		if ( isVowel (&buf_target_string[itr_elem]) )
		{ continue; }
		else
		{ printf ("%c", buf_target_string[itr_elem]); }
	}
	printf ("\n");

	// STEP.END
	return 0;
}
