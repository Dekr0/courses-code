package lecture8;

import java.awt.*;

public class Car {
    int maxSpeed = 0;
    int wheels = 0;
    Color colour = null;

    public Car() {

    }

    public Car(Color c) {
        maxSpeed = 100;
        wheels = 4;
        colour = c;
    }

    public Car(Color c, int w) {
        this(c);
        wheels = w;
    }

    public int getMaxSpeed() {
        return maxSpeed;
    }

    public void maintain() {
        System.out.println("Do car maintenance");
    }
}
