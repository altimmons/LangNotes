//
// Created by andyt on 2/7/2021.
//
#pragma once
#ifndef OOPCPP2_MIN_DOG_H
#define OOPCPP2_MIN_DOG_H
#endif //OOPCPP2_MIN_DOG_H

#include <string>
#include <utility>


typedef std::string str;
typedef uint32_t uint;
class Dog {

    //I had initially good intentions doing it this way, but in retrospect it was quite awkward.
public:
    typedef enum class Gender{ Male, Female, Undefined}Gender;

private:
    typedef bool Fleas;

    str m_Name = "Undefined";
    str m_Breed= "Unknown Breed";
    uint m_Age{0};
    uint m_Weight{0};
    Gender m_Gender{Gender::Undefined};
    Fleas m_Fleas{false};

public:
    Dog();
    Dog(str  name, str  breed, uint ageMonths, uint wtPounds, Fleas hasFleas, bool isMale  ) :
        m_Name(std::move(name)),
        m_Breed(std::move(breed)),
        m_Age(ageMonths),
        m_Weight(wtPounds),
        m_Fleas(hasFleas),
        m_Gender(getGender(isMale))
        {};
    Dog(str name, str breed) :  m_Name(std::move(name)), m_Breed(std::move(breed)){}
//    Dog(str& name, const char* breed, uint ageMonths, uint wtPounds, bool hasFleas, bool isMale  ) :
//        m_Name(name),
//        m_Breed(breed),
//        m_Age(ageMonths),
//        m_Weight(wtPounds),
//        m_Fleas(hasFleas),
//        m_Gender(getGender(isMale))
//        {};
    Dog(str& name, str& breed, uint ageMonths, uint wtPounds, Fleas hasFleas, Gender gender  ) :
        m_Name(name),
        m_Breed(breed),
        m_Age(ageMonths),
        m_Weight(wtPounds),
        m_Fleas(hasFleas),
        m_Gender(gender)
        {};
    ~Dog();

    /*trivial getters and setters so just declare inline.*/

    //todo comment all unused.. Ideally I'd do this the other way around.
    void setName(str &name) {m_Name = name;}
    void setName(str name) {m_Name=(std::move(name));}
    const str& getName(){return m_Name;}

    void setBreed(str &breed) { m_Breed = breed; }
    void setBreed(str breed) { m_Breed =(std::move(breed));}
    const str& getBreed() { return m_Breed; }

    void setAge(uint age) {m_Age = age;}
    uint getAge() const{return m_Age;} ;

    void setWeight(uint wt){m_Weight = wt;}
    uint getWeight() const {return m_Weight;}

    static Gender getGender(bool isMale){return ((isMale)?Gender::Male : Gender::Female); }
    void setGender(Gender gender){ m_Gender = gender;}
     str getGenderStr() {return ((m_Gender == Gender::Male ) ? "Male" : "Female");}

//    void setFleas(){m_Fleas = false;}
    void setFleas(bool f){m_Fleas = f;}
    bool hasFleas() const{return m_Fleas;}


    /* Methods */
    str getInfo();
    Dog getString();
    Dog eat();
    Dog bark();
    Dog scratch();

};



