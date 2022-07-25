package lecture19;

// Enum can also regulate behaviour / action with switch statement

public enum Operation {
    PLUS, MINUS;

    public double apply(double x, double y) {
        // Not perfect, add a new value and forget to add the case the method
        // No reasonable default
        switch(this) {
            case PLUS:
                return x + y;
            case MINUS:
                return x - y;
        }

        throw new AssertionError("Unknown op");
    }
}

enum NewOperation {
    PLUS {
        public double apply (double x, double y) {
            return x + y;
        }
    },

    MINUS {
        public double apply(double x, double y) {
            return x - y;
        }
    };

    // Every time a new value is created, that value must provide an implementation
    // of the abstract method. Safer
    public abstract double apply(double x, double y);
}
