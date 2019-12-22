// [contest]  ABC 127
// [task]     C
// [URL]      https://atcoder.jp/contests/abc127/tasks/abc127_c
// [compiler] C++ 14 (GCC 5.4.1)
// [status]   https://atcoder.jp/contests/abc127/submissions/5819264 : AC
// [reference]
// https://cpprefjp.github.io/reference/bitset/bitset.html

#include <iostream>
#include <algorithm>
#include <bitset>

#define num_cards_total_max 100000

int main (void)
{
	// variables for main process
	int num_cards_total;
	int num_cards_passable;
	int num_gates;
	int index_card_l_max;
	int index_card_r_min;

	// STEP.01
	// read out ...
	// 1. the number of the ID cards
	// 2. the number of the gates
	std::cin >> num_cards_total;
	std::cin >> num_gates;

	// STEP.02
	// construct a status list of the cards whether they can pass through all gates alone
	std::bitset<num_cards_total_max> list;

	// STEP.03
	// initialize the card status as all cards can pass through all gates independently
	for (size_t itr = 0; itr < num_cards_total; itr++) { list.set(itr); }

	// STEP.04
	// judge whether the cards can pass through all gates alone
	index_card_l_max = 0;
	index_card_r_min = num_cards_total;

	for (size_t itr = 0; itr < num_cards_total; itr++)
	{
		// STEP.04.01
		// read out the data whether the cards can pass through the gate
		int index_card_l_buf; std::cin >> index_card_l_buf;
		int index_card_r_buf; std::cin >> index_card_r_buf;

		// STEP.04.02
		// update the index of cards which can pass through all gates alone
		index_card_l_max = std::max(index_card_l_buf, index_card_l_max);
		index_card_r_min = std::min(index_card_r_buf, index_card_r_min);
	}

	// STEP.05
	// update the list of the cards whether they can pass through all gates alone
	for (size_t itr = 0;                   itr <  index_card_l_max - 1; itr++) { list.reset(itr); }
	for (size_t itr = num_cards_total - 1; itr >= index_card_r_min;     itr--) { list.reset(itr); }

	// STEP.05
	// output the number of cards which can pass through all gates alone
	std::cout << list.count() << std::endl;

	// STEP.END
	return 0;
}
