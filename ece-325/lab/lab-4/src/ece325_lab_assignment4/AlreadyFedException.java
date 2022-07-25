package ece325_lab_assignment4;

/**
 * This exception should be a checked exception. It prevent the same
 * animal being fed more than once at the same day.
 */
public class AlreadyFedException extends Exception {
    public AlreadyFedException(String message) {
        super(message);
    }
}