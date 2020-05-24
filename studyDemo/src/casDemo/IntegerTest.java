package casDemo;

import java.util.concurrent.atomic.AtomicInteger;

/**
 * @author 秦强
 * @version 1.0
 * @date 2020/5/20 19:50
 */
public class IntegerTest {
    public static void main(String[] args) {
        AtomicInteger atomicInteger = new AtomicInteger(5);
        // true
        System.out.println(atomicInteger.compareAndSet(5, 2020));
        // false
        System.out.println(atomicInteger.compareAndSet(5, 2020));

    }
}
