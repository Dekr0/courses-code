package ece325_assignment2;

public class Album extends SongCollection {

    // A string sequence that keep track of the song title using separator
    // "&&" to separate the title of each song.
    private String albumList;

    public Album() {
        albumList = "Empty album";
    }

    @Override
    public void addSongToCollection(Song s) {
        // Prevent a null reference or a song with same title being added into
        // the album
        if (s != null && !contains(s)) {
            if (getNumberOfSongs() == 0) albumList = "";
            super.addSongToCollection(s);

            // Concatenate a new song with a separator behind it
            albumList += "%s&&".formatted(s.getTitle());
        }
    }

    @Override
    public String toString() {
        if (getNumberOfSongs() == 0) return albumList;

        // Retrieve all the song titles into an array by splitting the separators
        // in the string sequence.
        String[] songTitles = albumList.split("&&");
        String str = "";

        int trackCounter = 1;
        for (String songTitle: songTitles)
            str += "Track #%d: %s\n".formatted(trackCounter++, songTitle);

        return str;
    }
}