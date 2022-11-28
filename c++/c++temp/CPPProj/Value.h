//
// Created by andyt on 3/11/2021.
//

#ifndef CPPPROJ_VALUE_H
#define CPPPROJ_VALUE_H
#include <string>
#include <map>
#include <vector>

using namespace std;
//std::map <std::string, std::

/**
 * These are the m_face values.
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

/**
 * Mapping to the strings.
 */
static const vector<std::string> faceName = {
		"Ace",     "2",    "3",     "4",
		"5",       "6",     "7",   "8",
		"9",       "10",    "Jack", "Queen",
		"King" };


/**
 * Map index value to obj.
 */
static const vector<card_t> cardLUT = {
		Undefined, Ace, Two, Three,
		Four, Five, Six, Seven, Eight,
		Nine, Ten, Jack, Queen, King
};
class Value
{
	card_t value;
public:
	Value(int lookupValue) : value(cardLUT.at(lookupValue)){};
};


#endif//CPPPROJ_VALUE_H
