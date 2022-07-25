package lecture19;

public enum Course {
    // These enum values are created by the Course constructor
    // If you want create enum values with more properties, you can
    // create fields and enum constructor to full fill those fields
    // in order to create desired enum values.
    ECE325 ("Object-Oriented Design", 3),
    ECE321 ("Software Requirements Engineering", 2);

    // Two fields
    private String descr;
    private int hoursPerWeek;

    private Course(String descr, int hours) {
        this.descr = descr;
        this.hoursPerWeek = hours;
    }

    public int getHoursPerWeek() {
        return hoursPerWeek;
    }
}