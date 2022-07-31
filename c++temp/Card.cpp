//
// Created by andyt on 3/10/2021.
//

#include "Card.h"
#include <iostream>
//card_t =
//{
//{ card_t::Ace, "Ace"}
//{ card_t::Two, "Two"}
//{ card_t::Three, "Three"}
//{
//        card_t::Four, "Four"}
//{ card_t::Five, "Five"}
//
//{ card_t::Six, "Six"}
//{ card_t::Seven, "Seven"}
//{ card_t::Eight, "Eight"}
//{ card_t::Nine, "Nine"}
//
//{ card_t::Ten, "Ten"}
//{ card_t::Jack, "Jack"}
//{ card_t::Queen, "Queen"}
//{ card_t::King, "King"}
//
//};



Card::Card ( ushrt_t face_v, ushrt_t suit_v ) {
	if (face_v >13 || suit_v > 3){
		std::cerr << "Invalid card value reference.  Fatal error. Exiting." << std::endl;
		exit(3);
	}
	m_face = Face_Int2Enum(face_v);
	m_suit = Suit_Int2Enum(suit_v);
}
string Card::toString () {
		string s =
	return
} card_t Card::getVale () { return Two; }
