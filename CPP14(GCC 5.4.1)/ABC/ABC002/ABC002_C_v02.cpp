// contest  : ABC 002
// task     : C
// URL      : https://atcoder.jp/contests/abc002/tasks/abc002_3
// compiler : C++14 (GCC 5.4.1)
// status   : https://atcoder.jp/contests/abc002/submissions/9271239 : WA
//          : https://atcoder.jp/contests/abc002/submissions/9272711 : WA
//          : https://atcoder.jp/contests/abc002/submissions/9272859 : AC

#include <cmath>
#include <iomanip>
#include <iostream>

struct Coordinate
{
	// data member
	public:
		double x = 0.0;
		double y = 0.0;

	// constuctor
	public:
		explicit Coordinate (const double & x, const double & y)
		{
			this->x = x;
			this->y = y;
		}

		explicit Coordinate (const double & val)
			: Coordinate(val, val)
		{
			/* Nothing to do in this block scope */
		}

		Coordinate (void)
			: Coordinate(0.0)
		{
			/* Nothing to do in this block scope */
		}
};

Coordinate operator + (Coordinate const & obj_lhs, Coordinate const & obj_rhs)
{
	return
		Coordinate
		{
			obj_lhs.x + obj_rhs.x,
			obj_lhs.y + obj_rhs.y,
		};
}

Coordinate operator - (Coordinate const & obj_lhs, Coordinate const & obj_rhs)
{
	return
		Coordinate
		{
			obj_lhs.x - obj_rhs.x,
			obj_lhs.y - obj_rhs.y,
		};
}



struct Triangle : public Coordinate
{
	// data member
	public:
		Coordinate point_a;
		Coordinate point_b;
		Coordinate point_c;

	// Construtor
	public:
		explicit Triangle (const Coordinate & point_a, const Coordinate & point_b, const Coordinate & point_c)
		{
			this->point_a = point_a;
			this->point_b = point_b;
			this->point_c = point_c;
		}

		explicit Triangle (const Coordinate & obj)
			: Triangle(obj, obj, obj)
		{
			/* Nothing to do in this block scope */
		}

		Triangle (void)
			: Triangle( Coordinate() )
		{
			/* Nothing to do in this block scope */
		}
};

double area (const Triangle & obj)
{
	Coordinate vctrAB = obj.point_b - obj.point_a;
	Coordinate vctrAC = obj.point_c - obj.point_a;
	
	return std::abs( vctrAB.x * vctrAC.y - vctrAB.y * vctrAC.x ) * 0.5;
}

int main (void)
{
	/* variables for main process */
	Triangle test_data;


	// STEP.01
	// read out the given test data
	std::cin
		>> test_data.point_a.x >> test_data.point_a.y
		>> test_data.point_b.x >> test_data.point_b.y
		>> test_data.point_c.x >> test_data.point_c.y
	;

	// STEP.02
	// output the result
	std::cout << std::fixed << area( test_data ) << std::endl;
	// std::cout << std::showpoint  << area( test_data ) << std::endl;	// <- WA
	// std::cout << std::scientific << area( test_data ) << std::endl;	// <- WA

	// STEP.END
	return EXIT_SUCCESS;
}

/* EOF */
