package semester.project.util;

public class Lo {
    public static void g(String message) {
        g(message, true);
    }

    public static void g(String message, boolean newLine) {
        if (newLine) {
            System.out.println(message);
        } else {
            System.out.print(message);
        }
    }
}
