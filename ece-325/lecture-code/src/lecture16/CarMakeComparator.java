package lecture16;

import java.util.Comparator;

public class CarMakeComparator implements Comparator<Car> {


    @Override
    public int compare(Car o1, Car o2) {
        return o1.getMake().compareTo(o2.getMake());
    }
}
