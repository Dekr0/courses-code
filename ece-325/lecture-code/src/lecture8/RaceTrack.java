package lecture8;

import java.util.ArrayList;

public class RaceTrack {
    ArrayList<Car> cars = new ArrayList<Car>();

    public RaceTrack() {

    }

    public Car getFastestCar() {
        Car fastestCar = cars.get(0);
        for (Car car:
             cars) {
            if (car.getMaxSpeed() > fastestCar.getMaxSpeed())
                fastestCar = car;
        }

        return fastestCar;
    }

    public static void main(String[] args) {
        RaceCar rc = new RaceCar(); // Cannot find a right constructor to use
        Car car2 = new RaceCar(); // from RaceCar
    }
}
