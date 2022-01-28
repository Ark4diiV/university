package task3;

public class Main {
    public static void main(String[] args) {
        Man man1 = new Man("Лев", 170);
        Man man2 = new Man("Сергей Пушкин", 168, man1);
        Man man3 = new Man("Александр", 167, man2);

        Man man4 = new Man("Рафаэль", "Димидов", 163);
        Man man5 = new Man("Сидор", 195, man4);
        Man man6 = new Man("Петр", 174, man5);

        System.out.println(man1);
        System.out.println(man2);
        System.out.println(man3 + "\n");
        System.out.println(man4);
        System.out.println(man5);
        System.out.println(man6);
    }
}
