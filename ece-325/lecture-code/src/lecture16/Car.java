package lecture16;


import java.util.ArrayList;

public class Car implements Comparable<Car>{
    int maxSpeed;
    String make;

    public Car(int maxSpeed, String make) {
        this.maxSpeed = maxSpeed;
        this.make = make;
    }

    public int getMaxSpeed() {
        return maxSpeed;
    }

    public String getMake() {
        return make;
    }

    @Override
    public int compareTo(Car o) {
        // Better solution, built-in comparison function for int
        int i = Integer.compare(getMaxSpeed(), o.getMaxSpeed());
        if (i != 0) return i;

        // sort by maxSpeed first and by make after that
        return make.compareTo(o.getMake());

        /* Old Solution
            if (getMaxSpeed() == o.getMaxSpeed()) return 0;
            if (getMaxSpeed() > o.getMaxSpeed())
                return 1;
            else
                return 0;
        */
    }

    public static void main(String[] args) {
        Car c1 = new Car(300, "Ferrari");
        Car c2 = new Car(320, "Lamborghini");
        Car c3 = new Car(250, "Alfa Romeo");
        Car c4 = new Car(180, "Jeep");
        Car c5 = new Car(180, "Jeep");

        ArrayList<Car> carList = new ArrayList<Car>();
        carList.add(c1);
        carList.add(c2);
        carList.add(c3);
        carList.add(c4);
        carList.add(c5);

        carList.sort(new CarMakeComparator());
        for (Car car:
             carList) {
            System.out.printf("%s, %d\n", car.getMake(), car.getMaxSpeed());
        }
    }
}
