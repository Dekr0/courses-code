package ece325_lab_assignment6;

public class MillisPerformanceMeasurement implements PerformanceMeasurement {

    private long start;
    private long end;

    @Override
    public void start() {
        start = System.currentTimeMillis();
    }

    @Override
    public void end() {
        end = System.currentTimeMillis();
    }

    @Override
    public void reset() {
        start = 0;
        end = 0;
    }

    @Override
    public long getResult() {
        return end - start;
    }
}
