package ece325_lab_assignment3;

public class Microphone extends Instrument{

    public Microphone(boolean needsWrapping) {
        super(needsWrapping);
    }

    @Override
    public String toString() {
        return "Microphone";
    }
}
