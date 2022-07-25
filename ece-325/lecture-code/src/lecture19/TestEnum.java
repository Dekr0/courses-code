package lecture19;

public class TestEnum {
    public static void main(String[] args) {
        String[] courses = {"ECE321", "ECE325"};

        int load = 0;
        for (String s : courses)
            load += Course.valueOf(s).getHoursPerWeek();

        System.out.println("Hours per week for your selection is:" + load);

        // printDay(Day.MONDAY);
    }

    public static void printDay(Day day) {
        switch (day) {
            // Without break statement, execution falls into next case
            // even if the execution already fell into one case.
            case MONDAY:
            case WEDNESDAY:
            case FRIDAY:
                System.out.println("ECE 325 lecture");
                break;
            default:
                System.out.println("No lecture");

        }
    }
}
