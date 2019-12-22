// AtCoder Beginner Contest 002 B
// [URL]        https://atcoder.jp/contests/abc002/tasks/abc002_2
// [compiler]   C (GCC 5.4.1)
// [submission] https://atcoder.jp/contests/abc002/submissions/4602085 : AC

#include <stdio.h>

#define max_len_target_string 30

int main (void)
{
	/* variables for main process */
	char buf_target_string[max_len_target_string];
	int  buf_rtvl_int;
	int  itr_elem;

	// STEP.01
	// read out the target integers
	buf_rtvl_int = scanf ("%s", &buf_target_string);

	// STEP.02
	// output the read string without designated characters
	for (itr_elem = 0; itr_elem < strlen (buf_target_string); itr_elem++)
	{
		if ( buf_target_string[itr_elem] == 'a' ) { continue; }
		if ( buf_target_string[itr_elem] == 'i' ) { continue; }
		if ( buf_target_string[itr_elem] == 'u' ) { continue; }
		if ( buf_target_string[itr_elem] == 'e' ) { continue; }
		if ( buf_target_string[itr_elem] == 'o' ) { continue; }

		printf ("%c", buf_target_string[itr_elem]);
	}
	printf ("\n");

	// STEP.END
	return 0;
}