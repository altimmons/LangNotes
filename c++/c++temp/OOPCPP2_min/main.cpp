

#include <iostream>
#include <string>
#include <memory>
//#include <string_view>
#include "Dog.h"


/*
 * (50 points) This assignment involves writing a program that models a dog. A dog
 * has a name, a breed (which may be unknown), a gender (male or female), an age
 * (in months), and a weight (in pounds). And…a dog may or may not have fleas. Dog
 * behaviors include eating ( “chomp chomp chomp” ), barking ( “woof woof woof”),
 * and scratching fleas if a dog has any ( you can determine what this sound should
 * be). Design a Dog class that models the attributes and behaviors described above.
 *
 * Provide appropriate class constructors, getter methods, setter methods, and any
 * other methods you think are necessary to model a dog.
 *
 * Write a program that creates at least two dogs, invokes their behaviors, and
 * displays their attributes.
 *
 * Submit your source code and a screen capture of program output.
 *
 * 2. (50 points) Identify candidate classes, including attributes and methods, for the
 * blackjack game description posted on the course website. No code needs to be
 * written for this assignment. Use a UML drawing tool to document each candidate
 * class and be sure to specify attribute and method visibility. Relationships between
 * classes need not be shown.
 *
 *
 * dog
 *  name
 *  breed (inc, unknown)
 *  gender (enum M or F)
 *  age (#mo)
 *  weight (lbs)
 *  fleas(bool)
 *
 *  methods
 *      eating
 *       << “chomp chomp chomp”
 *      barking
 *        << “woof woof woof”
 *      scratching (if hasFleas)
 */
int main() {

    using namespace std;

    const string name("Rusty"), breed("Mixed Shorthair");
    Dog dog;
    Dog dog1( name, breed, 60, 20, false, true );





    cout << "Default Dog:\n";
    dog.getString().eat().bark().scratch();

    cout << "\n\nDog1:\n";
    dog1.getString().eat().bark().scratch();


    Dog dog2;
    dog2.setName("Freckles");
    dog2.setBreed("Cocker Spaniel");
    dog2.setWeight(10);
    dog2.setAge(24);
    dog2.setFleas(true);
    dog2.setGender(Dog::Gender::Male);
    cout << "\n\nDog2:\n";
    dog2.getString().eat().bark().scratch();
//    std::cout << dog.getInfo() << std::endl;

    unique_ptr<Dog> heapDog(new Dog("Maggie", "Terrier", 240, 170, true, false));
    cout << "\n\n A Dog on A Heap-\n";
    heapDog -> getString().eat().bark().scratch();

    return 0;
}
