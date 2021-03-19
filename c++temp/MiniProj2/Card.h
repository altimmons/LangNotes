//
// Created by andyt on 3/11/2021.
//
#include <map>
#include <unordered_map>
#include <vector>
#include <string>
#include <limits>
//#include "Suit.h"

#ifndef MINIPROJECT2_CARD_H
#define MINIPROJECT2_CARD_H

using namespace std;


#ifndef ushrt_t
typedef unsigned short ushrt_t;
#endif

#ifndef card_t

/**
 * These are the m_faceVal values.
 * Not enum class because I want to be able to translate to int and back, since for most the
 * cards its equivalent
 */

typedef enum card_value
{
	Undefined,
	Ace = 1,
	Two, 	    Three,  	Four,   	Five,   	Six,
	Seven,  	Eight,  	Nine,   	Ten,    	Jack,
	Queen,  	King = 13
} card_t;
#endif
/**
 * These are the m_suit values.
 * Not enum class because I want to be able to translate to int and back, since for most the
 * cards its equivalent
 */
typedef enum suit_t
{
	UndefSuit,
	Hearts = 3,
	Diamonds,
	Clubs,
	Spades = 6
} SUIT;


typedef enum CardColor{
	Undef, RED, BLACK
}color_t;





typedef unsigned int face_Value_index;

class Card
{
private:



	/*These are all translator methods */
	/*In retrospect I could have done it better
	 * but I always spend too much (way too much)
	 * time rewriting code to be nicer for no reason*/

	static const vector<suit_t> suit_LUT;
	static const vector<const char *> suit_symbol_LUT;
	static const vector<string> suit_repr;
	static const vector<card_t> cardLUT;
	static const vector<bool>isBlack;
	static const vector<string> face_repr_LUT;
	static const map<card_t, string> mp_ValueEn_Str;
	static const map<suit_t, bool> isRedMap;
	static const map<string, card_t> mp_str_Value;
	static const map<color_t, string> mp_color_string;
	static const map<const suit_t, const color_t> colorMap;



	const card_t m_cardValue;
	const suit_t m_cardSuit;
	const color_t m_cardColor;
	ushrt_t card_t_index{0};
	ushrt_t suit_t_index{0};
	ushrt_t color_t_index{0};

public:
	Card(ushrt_t face_v, ushrt_t suit_v):
                     m_cardSuit(suit_LUT.at(suit_v)),
					m_cardValue(cardLUT.at(face_v)),
					m_cardColor(colorLUT.at(suit_v)){
		card_t_index = indexof ( m_cardValue );
		suit_t_index = indexof ( m_cardSuit );
		color_t_index = indexof ( m_cardColor );
	};
	Card(card_t value, suit_t suit):
				 m_cardValue(value),          m_cardSuit(suit),
                 m_cardColor ( colorLUT.at(indexof(suit))){
		card_t_index = indexof ( m_cardValue );
		suit_t_index = indexof ( m_cardSuit );
		color_t_index = indexof ( m_cardColor );};
	std::ostream& operator << (std::ostream& outs) const;
	[[nodiscard]] string getValueString() const ;
	static std::string repr(card_t type);
	static std::string repr(suit_t type);

	string repr();


	template <typename Enumeration>
	 static auto indexof(Enumeration const value)
	-> typename std::underlying_type<Enumeration>::type
	{
		return static_cast<typename std::underlying_type<Enumeration>::type>(value);
	}


	static const vector<color_t> colorLUT;
	static const vector<string> suitColorStrLUT;
};


#endif//MINIPROJECT2_CARD_H
