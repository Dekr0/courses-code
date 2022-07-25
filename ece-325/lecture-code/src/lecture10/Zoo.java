package lecture10;

import java.util.ArrayList;

public class Zoo {

    PetStore petStore;
    ArrayList<Animal> inventory;

    Zoo() {
        petStore = new PetStore();
        inventory = new ArrayList<>();
    }

    public void addToInventory(Animal a) {
        inventory.add(a);
        if (a instanceof Pet) {
            petStore.addToInventory((Pet) a);
        }
    }

    public void petAllTheAnimals() {
        for (Animal animal: inventory) {
            if (animal instanceof Pet) {
                ((Pet) animal).pet();
            }
        }
    }

    void listenToAnimals() {
        for (Animal animal: inventory) {
            animal.makeSound();
        }
    }

    public static void main(String[] args) {
        Zoo z = new Zoo();

        Dogs d = new Dogs();
        Wolves w = new Wolves();
        Cats c = new Cats();
        Lions l = new Lions();

        z.addToInventory(d);
        z.addToInventory(w);
        z.addToInventory(c);
        z.addToInventory(l);

        z.petAllTheAnimals();
        z.listenToAnimals();
    }
}
