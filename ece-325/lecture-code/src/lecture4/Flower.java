package lecture4;


public class Flower {

    private int petalCount = 0;
    private String s = new String("null");

    Flower(int petals) {
        petalCount = petals;
        System.out.println("petalCount = " + petalCount);
    }

    // "this" conventionally is in the sense of "this object", and by itself it
    //  produces the handle to the current object.

    Flower (String s) {
        this.s = s;
    }

    // In a constructor, "this" keyword takes on a different meaning when an
    //  argument list, it makes an explicit all the to the constructor that
    // matches that argument list.

    Flower(String s, int petals) {
        this(petals);
        // this(s); // Can't call two
        this.s = s;
    }

}
