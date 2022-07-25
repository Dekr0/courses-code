package lecture9;

public interface Hybrid {

    void charge(); // interface methods are always abstract

    // Default method behaviour allow a class who implement
    // that interface, that class do not have to implement
    // that default method as long as the default method
    // behavior is specify. This provide backward compatibility.
}
