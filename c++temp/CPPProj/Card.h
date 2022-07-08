//
// Created by andyt on 3/10/2021.
//
#include "Suit.h"
#include "Value.h"
#include <map>
#include <string>
#include <unordered_map>
#include <vector>
#include <memory>

#ifndef CPPPROJ_CARD_H
#define CPPPROJ_CARD_H

#ifndef ushrt_t
typedef unsigned short ushrt_t;
#endif



using namespace std;





// 3:♥ 4:♦ 5:♣ 6:♠
//typedef enum suit_t
//{
//	Hearts = 3,
//	Diamonds,
//	Clubs,
//	Spades = 6
//} cart_suit_t;

static const vector<suit_t> suit_LUT = {Hearts, Diamonds, Clubs, Spades};
static const vector<string> suit_name_LUT = {"Hearts", "Diamonds", "Clubs", "Spades"};


/**
 * Needs cast from uint to char type
 */

//std::unordered_map<card_t, int, std::hash<int>> map;



class Card
{

private:
	//m_face value of the card.  Runs 1-13. lookup name in enum. 0 = uninitialized
	card_t m_face;
	suit_t m_suit;
	Value value;
	Suit suit;
	Color color;

public:

	card_t getValue()

	std::string toString();

	static card_t Face_Int2Enum ( int lookupValue ) {	return cardLUT.at(lookupValue);};
	static suit_t Suit_Int2Enum ( int lookupValue ) {	return  suit_LUT.at(lookupValue);};
	static string Suit_int2str ( int lookupValue ) {	return  suit_name_LUT.at(lookupValue);};


};
//	Card(ushrt_t face_, ushrt_t suit_v);
//	Card(card_t type, suit_t suit): m_face (type), m_suit (suit){};
//	Card(card_t type, suit_t suit): m_face (type), m_suit (suit){};



/*
std::cout << static_cast<std::underlying_type<A>::type>(a) << std::endl;

used as:

std::cout << as_integer(a) << std::endl;
*/
#endif//CPPPROJ_CARD_H
