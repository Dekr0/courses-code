package lecture12;


public class Car {
    int maxSpeed;

    public Car() {
        maxSpeed = 200;
    }

    public int getMaxSpeed() {
        return maxSpeed;
    }

    public static void main(String[] args) {
        RaceCar car = new RaceCar();
        System.out.println(car.getMaxSpeed());
    }
}


class RaceCar extends Car {

    public RaceCar() {
        maxSpeed = 370;
    }
}