package lecture14;

// Need to include generic decoration, otherwise, we are implementing
// a different interface and losing important type checking given
// from type checking
public class OurPair<K, V> implements Pair<K, V>{
    private K key;
    private V value;

    public OurPair(K key, V value) {
        this.key = key;
        this.value = value;
    }

    public K getKey() {
        return key;
    }

    public V getValue() {
        return value;
    }

    public static <K,V> boolean compare(Pair<K, V> p1, Pair<K, V> p2) {
        return p1.getKey().equals(p2.getKey()) && p1.getValue().equals(p2.getValue());
    }

    public static void main(String[] args) {
        OurPair<String, Integer> p1 = new OurPair<>("test", 8);
        OurPair<Integer, String> p2 = new OurPair<>(8, "test");
    }
}
