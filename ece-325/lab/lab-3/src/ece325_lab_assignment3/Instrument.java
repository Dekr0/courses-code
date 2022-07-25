package ece325_lab_assignment3;

public class Instrument extends Equipment {

    public Instrument(boolean needsWrapping) {
        super(needsWrapping);
    }

    @Override
    public String toString() {
        return "Instrument";
    }
}
