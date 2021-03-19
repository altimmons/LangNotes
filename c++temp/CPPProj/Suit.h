//
// Created by andyt on 3/10/2021.
//

#include <string>
#include <map>
#include <vector>

#ifndef CPPPROJ_SUIT_H
#define CPPPROJ_SUIT_H

#ifndef ushrt_t
typedef unsigned short ushrt_t;
#endif


static const std::vector<char> suit_char_LUT = {'H', 'D', 'C', 'S'};

typedef enum suit_t
{
	Hearts = 3,
	Diamonds,
	Clubs,
	Spades = 6
}suit;





class Suit
{
private:
	static bool showChars;
	static const char heart_sym {3};
	static const char diamond_sym {4};
	static const char club_sym {5};
	static const char spades_sym {6};
	static const std::vector<suit_t>suit_v;
	static const std::vector<const char*> suit_symbol_LUT;// = { &heart_sym, &diamond_sym,
	// &club_sym, &spades_sym};
public:
	suit_t suit;
	Suit(suit_t suit): suit(suit){};
	Suit(int suit_int): suit(suit_v.at(suit_int)){};
	static void setSymbolView(bool canShow){showChars = canShow;};
	std::string name();

	template <typename Enumeration>
	auto indexof(Enumeration const value)
	-> typename std::underlying_type<Enumeration>::type
	{
		return static_cast<typename std::underlying_type<Enumeration>::type>(value);
	}

};

//
//class Suit_Static_Values{
//	public:
//
//
//	Suit_Static_Values();
//	    Suit_Static_Values ( bool symbols );
//};

#endif//CPPPROJ_SUIT_H
