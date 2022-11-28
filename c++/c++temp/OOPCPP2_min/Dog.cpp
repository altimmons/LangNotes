//
// Created by andyt on 2/7/2021.
//

#include <iostream>
#include "Dog.h"

Dog::~Dog() = default;

Dog::Dog() {
    m_Name = "Undefined";
    m_Age = 0;
    m_Breed = "Unknown Breed";
    m_Weight = 0;
    m_Gender = Gender::Female;
    m_Fleas = false;
}

str Dog::getInfo() {
    using namespace std; //need this to access the string literal operator 's'. to convert the  ternary to string -
    // instead of cons char.  Could also cast.

    str s; //should use a wstring or similar, but I accidentally set the project to C++ 11 and cant figure how to change it.
    s += "This is a " + std::to_string(getAge()) + " m/o ";
    s += getGenderStr() + " dog of " + getBreed() + " named \'" + getName()  + "\'.  ";
    s += ((getGenderStr() == "Male") ? "He "s :"She "s);
    s += "is " + to_string(getWeight()) + "# and " ;
    s += ((getGenderStr() == "Male") ? "he "s :"she "s);
    s += ( (str)"does " + ((hasFleas()) ? "":"not ") + "have fleas. ") ;
    return s;
}

/**
 * Wraps getInfo() and just goes ahead to dump to stdout without bothering to do it in main.
 * Returns a self reference to allow chaining.
 * @return *this
 */
Dog Dog::getString()  {
    std::cout<< getInfo() << std::endl;
    return *this;
}

/**
 * just displays "chomp chomp chomp".
 * Returns a self reference to allow chaining.
 * @return *this
 */
Dog Dog::eat() {
    std::cout<< getName() + " goes \'Chomp, Chomp, Chomp\'.\n";
    return *this;
}

/**
 * just displays "woof woof woof".
 * Returns a self reference to allow chaining.
 * @return *this
 */
Dog Dog::bark() {
    std::cout<< getName() + " says \"Woof, Woof, Woof\".\n";
    return *this;
}

/**
 * just displays "Scritch, Scritch, Scritch" iff fleas is true.
 * Returns a self reference to allow chaining.
 * @return *this
 */
Dog Dog::scratch() {
    if (hasFleas()){
        std::cout<< getName() + " goes \'Scritch, Scritch, Scritch\'.\n";
    }else{
        std::cout<< getName() + " says \"No\" (fleas).\n";
    }
    return *this;
}
