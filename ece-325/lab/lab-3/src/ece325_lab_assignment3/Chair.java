package ece325_lab_assignment3;

public class Chair extends Equipment{

    public Chair(boolean needsWrapping) {
        super(needsWrapping);
    }

    @Override
    public String toString() {
        return "Chair";
    }
}