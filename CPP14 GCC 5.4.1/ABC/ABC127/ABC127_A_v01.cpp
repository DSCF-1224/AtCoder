// [contest]  ABC 127
// [task]     A
// [URL]      https://atcoder.jp/contests/abc127/tasks/abc127_a
// [compiler] C++ 14 (GCC 5.4.1)
// [status]   https://atcoder.jp/contests/abc127/submissions/5809777 : AC

#include <iostream>

int main (void)
{
	// variables for main process
	int val_age;
	int val_cost_need;
	int val_cost_adult;

	// STEP.01
	// read out the costs
	std::cin >> val_age;
	std::cin >> val_cost_adult;

	// STEP.02
	// calculate the cost to pay
	if      (val_age >= 13) { val_cost_need = val_cost_adult;     }
	else if (val_age >=  6) { val_cost_need = val_cost_adult / 2; }
	else                    { val_cost_need = 0;                  }

	// STEP.02
	// output the cost to pay
	std::cout << val_cost_need << std::endl;

	// STEP.END
	return 0;
}
