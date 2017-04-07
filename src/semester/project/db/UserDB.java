package semester.project.db;

import semester.project.bean.User;

public class UserDB {
    public static void insert(User user) {
        System.out.println("Inserted User \"" + user.getFirstName() + " " + user.getLastName() + "\" into database.");
    }
}
