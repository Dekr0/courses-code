package lecture10;

public class Cats extends Canines implements Pet{

    @Override
    public void pet() {
        System.out.println("Petting a cat");
    }

    @Override
    public void makeSound() {

    }
}
