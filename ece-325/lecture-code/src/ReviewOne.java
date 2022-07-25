public class ReviewOne {

    public static void main(String[] args) {
       // Animal animal1 = new Animal(); a

       Animal animal2 = new Dog(); // b

       Canine canine1 = new Canine(); // c

       // Dog dog1 = new Canine(); // d

       Object obj1 = new Dog(); // e

       Animal animal = new Dog(); // f
       animal.eat();

       Canine canine = new Canine(); // g
       canine.makeSound();

       Animal animal3 = new Dog(); // h
       animal3.makeSound();

       // Object obj2 = new Dog(); polymorphism depends on the reference in compiler time i
       // obj2.eat();
    }
}

abstract class Animal {
    abstract void eat();

    void makeSound() {
        System.out.println("Animal make sound");
    }

}

class Canine extends Animal {
    void eat() {
        System.out.println("Canine eat");
    }
}

class Dog extends Canine {
    void makeSound() {
        System.out.println("Dog make sound");
    }
}
