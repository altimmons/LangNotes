//
// Created by andyt on 3/11/2021.
//

#include "Card.h"
#include <sstream>
#include <cstdio>

static const char heart_sym {3}; /*Unicode U+2665 U+2661*/
static const char diamond_sym {4};/*Unicode U+2666 U+2662*/
static const char club_sym {5}; ;/*Unicode U+2667 U+2663*/
static const char spades_sym {6};/*Unicode U+2660 U+2664*/
static const char null_sym {68};

const std::vector<const char*> Card::suit_symbol_LUT = { &null_sym, &heart_sym, &diamond_sym,
                                                          &club_sym,
                                                         &spades_sym};

const std::vector<std::string> Card::suit_repr= {"Undefined", "Hearts", "Diamonds", "Clubs",
                                                   "Spades"};
static const std::vector<char> suit_char_LUT = {'#','H', 'D', 'C', 'S'};
const vector<color_t> Card::colorLUT = {Undef, RED, RED, BLACK, BLACK};
const vector<std::string> Card::suitColorStrLUT = {"?","RED", "RED", "BLACK", "BLACK"};

const std::vector<suit_t>Card::suit_LUT = {UndefSuit, Hearts, Diamonds,Clubs, Spades};

const vector<card_t> Card::cardLUT = {
		Undefined, Ace, Two, Three,
		Four, Five, Six, Seven, Eight,
		Nine, Ten, Jack, Queen, King
};

const vector<bool>Card::isBlack = {false, false, false, true, true};

const map<suit_t, bool> Card::isRedMap = {
		  {UndefSuit, false}
		, {Hearts, true}
		, {Diamonds, true}
		, {Clubs, false}
		, {Spades, false}
};



const map<const suit_t, const color_t> Card::colorMap = {
		  {UndefSuit, Undef}
		, {Hearts, RED}
		, {Diamonds, RED}
		, {Clubs, BLACK}
		, {Spades, BLACK}
};


//const map<suit_t, string> Card::mp_color_string = {
//		  {Hearts, "RED"}
//		, {Diamonds, "RED"}
//		, {Clubs, "BLACK"}
//		, {Spades, "BLACK"}
//};

const map<color_t, string> Card::mp_color_string = {
		  {RED, "red"}
		, {BLACK, "black"}
};

const vector<std::string> Card::face_repr_LUT = {
		"Ace",     "2",    "3",     "4",
		"5",       "6",     "7",   "8",
		"9",       "10",    "Jack", "Queen",
		"King" };




/**
 *Maps An enum to the string.  Obviously many ways to do this, I chose this one.
 */
const map<card_t, std::string> Card::mp_ValueEn_Str{
		{ card_t::Undefined, "UNDEF" },
		{ card_t::Ace, "Ace" },
		{ card_t::Two, "Two" },
		{ card_t::Three, "Three" },
		{ card_t::Four, "Four" },
		{ card_t::Five, "Five" },
		{ card_t::Six, "Six" },
		{ card_t::Seven, "Seven" },
		{ card_t::Eight, "Eight" },
		{ card_t::Nine, "Nine" },
		{ card_t::Ten, "Ten" },
		{ card_t::Jack, "Jack" },
		{ card_t::Queen, "Queen" },
		{ card_t::King, "King" }
};

const map<std::string, card_t> Card::mp_str_Value{
		{ "UNDEF", card_t::Undefined},
		{ "Ace", card_t::Ace},
		{ "Two", card_t::Two},
		{ "Three", card_t::Three},
		{ "Four", card_t::Four},
		{ "Five", card_t::Five},
		{ "Six", card_t::Six},
		{ "Seven", card_t::Seven},
		{ "Eight", card_t::Eight},
		{ "Nine", card_t::Nine},
		{ "Ten", card_t::Ten},
		{ "Jack", card_t::Jack},
		{ "Queen", card_t::Queen},
		{ "King", card_t::King}
};




string Card::getValueString () const
{
	card_t value = this->m_cardValue;
	return mp_ValueEn_Str.at ( value );
}


std::string Card::repr ( suit_t type ) { return suit_repr.at ( indexof(type) ); }
std::string Card::repr ( card_t type ) { return mp_ValueEn_Str.at ( type ); }


std::string Card::repr () {
//
//	ss<< "Card:["<< this<< "]=" <<mp_ValueEn_Str.at(m_cardValue) << "[" <<
//	        face_repr_LUT[card_t_index] << "("
char buffer[50];
 sprintf(buffer, "Card:[%ld]=%s[%s](%d) of %s(%d) which is *%s*.%d", this,
&mp_ValueEn_Str.at(m_cardValue) ,&face_repr_LUT[card_t_index] , card_t_index, &suit_repr.at
					(m_cardSuit),suit_t_index,	&suitColorStrLUT.at(m_cardSuit), color_t_index);

}
std::ostream &Card::operator<< ( ostream &outs ) const {
	const char letters[]= "_A23456789TJQK";
//	        3:♥ 4:♦ 5:♣ 6:♠
	char suitrepr[] ={0,3,4,5,6,0};
	return outs << letters[this->card_t_index] << (char)suitrepr[this->suit_t_index];
}

