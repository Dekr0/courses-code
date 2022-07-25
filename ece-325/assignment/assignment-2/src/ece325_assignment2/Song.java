package ece325_assignment2;

public class Song {

    private String title;

    public Song(String title) {
        this.title = title;
    }

    public String getTitle() {
        return title;
    }

    /**
     * @param o Object that need to be compared with current Song object
     * @return result of whether two Song objects have the same title. If
     * the object from the parameter is null, or is not the same class,
     * the comparison will be false.
     */
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        Song s = (Song) o;

        // pass to equals() method of String
        return title.equals(s.getTitle());
    }
}