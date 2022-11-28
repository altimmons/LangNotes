#include "Card.h"
#include <cstdio>
#include <iostream>

int main ()
{

//	std::cout << heart << '\n';
	Card* card;
	card = new Card(card_t::King, suit_t::Clubs);

	std::cout << "Hello, World!" << std::endl;
	std::string s = reinterpret_cast<const char *> ( sprintf ( "Test %d", "%s", 98 ) );
	int n, a=5, b=3;
//	n=sprintf (buffer, "%d plus %d is %d", a, b, a+b);
	return 0;

}
