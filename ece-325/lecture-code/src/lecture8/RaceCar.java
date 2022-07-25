package lecture8;

import java.awt.*;

public class RaceCar extends Car {

    public RaceCar() {

    }

    public RaceCar(Color c) {
        super(c);
    }

    public RaceCar(Color c, int w) {
        super(c, w);
    }

    public void race() {
        System.out.println("race");
    }

    @Override
    public void maintain() {
        System.out.println("DO race car maintenance");
    }
}
