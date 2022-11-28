//
// Created by andyt on 3/10/2021.
//

#include "suit.h";


typedef enum key_type{
	Repr,
	Char,
	Symb
}key_t;


const std::vector<const char*> Suit::suit_symbol_LUT = { &heart_sym, &diamond_sym, &club_sym,
                                                         &spades_sym};

const std::vector<std::string> suit_repr= {"Hearts", "Diamonds", "Clubs", "Spades"};


const std::vector<suit_t>suit_v = {Hearts, Diamonds,Clubs, Spades};


std::string Suit::name () { return nullptr; }


//
//std::map<suit_t, std::string> names = {
//		{
//				{suit_t::Hearts, "Hearts"},
//				{suit_t::Diamonds, "Diamonds"},
//				{suit_t::Clubs, "Clubs"},
//				{suit_t::Spades, "Spades"}
//        }
//};
//std::map<suit_t, std::string> chars = {
//		{
//				{suit_t::Hearts, "H"},
//				{suit_t::Diamonds, "D"},
//				{suit_t::Clubs, "C"},
//				{suit_t::Spades, "S"}
//        }
//};
//std::map<suit_t, char> symbols = {
//		{
//				{suit_t::Hearts, (char)3},
//				{suit_t::Diamonds, (char)4},
//				{suit_t::Clubs, char(5)},
//				{suit_t::Spades, "S"}
//        }
//}



};






