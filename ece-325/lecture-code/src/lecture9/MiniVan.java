package lecture9;

public class MiniVan extends Car implements Hybrid, SuperHybrid {

    private boolean hasHitch;

    public String showDetails() {
        return "Hitch: " + hasHitch;
    }

    @Override
    // Name Clash is allowed in interface because Interface only requires the
    // class that implement that interface, have all the method signature but
    // doesn't specify whether they are same or different implementation.

    // All subclass of an abstract (normal?) class that implement an interface
    // will automatically implement that interface.
    public void charge() {
        System.out.println("Charging");
    }

    public void setHasHitch(boolean hasHitch) {
        this.hasHitch = hasHitch;
    }

    public static void main(String[] args) {
        MiniVan van = new MiniVan();
        van.setHasHitch(true);
        van.showDetails();
        van.charge();
    }
}
