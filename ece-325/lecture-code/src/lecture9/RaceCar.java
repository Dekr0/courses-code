package lecture9;

public class RaceCar extends Car {
    private boolean turbo;

    public String showDetails() {
        return "Turbo: " + turbo;
    }

    public void race() {
        System.out.println("Race");
    }
}
