/* AtCoder Beginner Contest 003 C */
/*

[URL]
https://atcoder.jp/contests/abc001/tasks/abc003_3

[compiler]
C++14 (GCC 5.4.1)

[reference]
<1> https://cpprefjp.github.io/reference/algorithm/sort.html
<2> https://cpprefjp.github.io/reference/algorithm/partial_sort.html

*/

#include <algorithm>
#include <iostream>
#include <vector>

#define num_video_max 100

int main (void)
{
	// STEP.01
	// read out the number of the videos and ones which he can watch
	int num_video_total;
	int num_video_watch;
	std::cin >> num_video_total >> num_video_watch;

	// STEP.02
	// declare the `std::vector` to store values of rate of each video
	std::vector<int> rate_video(num_video_total);

	// STEP.03
	// read out the values of rate of each video
	for(size_t itr = 0; itr < num_video_total; itr++) std::cin >> rate_video[itr];

	// STEP.04
	// sort the values of rate of each video
	std::sort( rate_video.begin(), rate_video.end() );

	// STEP.END
	return 0;
}
