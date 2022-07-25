package lecture21;

public class Car {
    private Tire[] tires;

    public Car() {
        tires = new Tire[4];
        for (int i = 0; i < tires.length; i++)
            tires[i] = new Tire();
    }

    public void inflate(int pos, int p) {
        tires[pos].inflate(p);
    }
}


/**
 * Standalone class if the classes do not have very small amount of features
 * (methods and members), or it also need to be used by others in public.
 *
 * public nested class can be accessed by outer scope but it requires an extra
 * step to access it (OuterClass.InnerClass for example)
 */
class Tire {
    int idealPressure;
    int actualPressure;

    public void inflate(int p) {
        actualPressure += p;
    }
}
