// [contest]  ABC 127
// [task]     C
// [URL]      https://atcoder.jp/contests/abc127/tasks/abc127_c
// [compiler] C++ 14 (GCC 5.4.1)
// [status]   https://atcoder.jp/contests/abc127/submissions/5817379 : TLE
// [reference]
// https://cpprefjp.github.io/reference/bitset/bitset.html

#include <iostream>
#include <bitset>

#define num_cards_total_max 100000

int main (void)
{
	// variables for main process
	int num_cards_total;
	int num_cards_passable;
	int num_gates;
	int index_card_left;
	int index_card_right;

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
	for (size_t itr_gate = 0; itr_gate < num_cards_total; itr_gate++)
	{
		// STEP.04.01
		// read out the data whether the cards can pass through the gate
		std::cin >> index_card_left;
		std::cin >> index_card_right;

		// STEP.04.02
		// update the list of the cards whether they can pass through all gates alone
		for (size_t itr_card = 0;                   itr_card <  index_card_left - 1; itr_card++) { list.reset(itr_card); }
		for (size_t itr_card = num_cards_total - 1; itr_card >= index_card_right;    itr_card--) { list.reset(itr_card); }
	}

	// STEP.05
	// output the number of cards which can pass through all gates alone
	std::cout << list.count() << std::endl;

	// STEP.END
	return 0;
}
