package ece325_lab_assignment3;

public class Guitar extends Instrument{

    public Guitar(boolean needsWrapping) {
        super(needsWrapping);
    }

    @Override
    public String toString() {
        return "Guitar";
    }
}
