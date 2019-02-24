// AtCoder Beginner Contest 069 B
// [URL]      https://atcoder.jp/contests/abc069/tasks/abc069_b
// [compiler] C (GCC 5.4.1)
// 
#include <stdio.h>
#include <string.h>

#define LEN_WORD 100

int main (void)
{
	/* variables for main process */
	char buffer_word[LEN_WORD];
	int  len_target_word;

	// STEP.01
	// read out the targe word
	scanf( "%s", buffer_word );

	// STEP.02
	// get the length of the target word
	len_target_word = strlen( buffer_word );

	// STEP.03
	// output the shortened word
	printf( "%c%d%c\n", buffer_word[0], len_target_word-2, buffer_word[ len_target_word-1 ] );

	// STEP.TRUE_END
	return 0;
}
