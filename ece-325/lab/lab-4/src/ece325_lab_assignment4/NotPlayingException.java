package ece325_lab_assignment4;

// This should be a checked exception. It prevents the artist feeding the animals
// without the show starts since the artist might fail to start the show because
// of distraction.
public class NotPlayingException extends Exception {
    public NotPlayingException(String message) {
        super(message);
    }
}