// [contest]  ABC 127
// [task]     C
// [URL]      https://atcoder.jp/contests/abc127/tasks/abc127_c
// [compiler] C++ 14 (GCC 5.4.1)
// [status]   https://atcoder.jp/contests/abc127/submissions/5819308 : WA
// [status]   https://atcoder.jp/contests/abc127/submissions/5819337 : WA
// [status]   https://atcoder.jp/contests/abc127/submissions/5819352 : AC
// [reference]
// https://cpprefjp.github.io/reference/bitset/bitset.html

#include <iostream>
#include <algorithm>

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
	// read out the data of index
	index_card_l_max = 0;
	index_card_r_min = num_cards_total;

	for (size_t itr = 0; itr < num_cards_total; itr++)
	{
		// STEP.02.01
		// read out the data whether the cards can pass through the gate
		int index_card_l_buf; std::cin >> index_card_l_buf;
		int index_card_r_buf; std::cin >> index_card_r_buf;

		// STEP.02.02
		// update the index of cards which can pass through all gates alone
		index_card_l_max = std::max(index_card_l_buf, index_card_l_max);
		index_card_r_min = std::min(index_card_r_buf, index_card_r_min);
	}

	// STEP.03
	// calculate the number of cards which can pass through all gates alone
	if (index_card_l_max <= index_card_r_min) { num_cards_passable = index_card_r_min - index_card_l_max + 1; }
	else                                      { num_cards_passable = 0;                                       }
	
	// STEP.04
	// output the number of cards which can pass through all gates alone
	std::cout << num_cards_passable << std::endl;

	// STEP.END
	return 0;
}
