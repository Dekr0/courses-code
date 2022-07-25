package lecture9;


public class Tesla extends NewCar {

    public void charge() {
        System.out.println("Charge");
    }

    @Override
    public String showDetails() {
        return "Tesla";
    }
}
