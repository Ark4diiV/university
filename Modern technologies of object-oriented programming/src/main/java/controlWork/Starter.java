package controlWork;

public class Starter {
    public static void main(String... args) {
        Point p1 = new Point();
        p1.x = 1;
        p1.y = 2;
        System.out.println(p1);
        Point p2 = new Point();
        p2.x = -3;
        p2.y = 6;
        System.out.println(p2);

        System.out.println();

        Point point1 = new Point(23,32);
        Point point2 = new Point(-4,-17);
        Point point3 = new Point(-8,19);

        System.out.println(point1);
        System.out.println(point2);
        System.out.println(point3);

    }

}
