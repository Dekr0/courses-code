package lecture10;

import java.util.ArrayList;

public class PetStore {

    ArrayList<Pet> inventory;

    PetStore() {
        inventory = new ArrayList<>();
    }

    void addToInventory(Pet p) {
        inventory.add(p);
    }
}
