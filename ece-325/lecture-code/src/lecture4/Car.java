package lecture4;

// Class name with suffix "s" usually implies the class that it is a collection

public class Car {
    int maxSpeed;

    // Compiler will complain that it cannot find a default constructor if
    // a class does not provide one when overloading constructor.
    public Car(int m) {
        maxSpeed = m;
    }

    public int getMaxSpeed() {
        return maxSpeed;
    }

    public static void main(String[] args) {
        Car c1 = new Car(300);
//      Car c2 = new Car();
        Car c2 = new Car(200);
        Race r = new Race();

        r.race(c1, c2);
    }
}

class Race {

    public Car race(Car c1, Car c2) {
        if (c1.getMaxSpeed() > c2.getMaxSpeed())
            return c1;
        else return c2;
    }
}