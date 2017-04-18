package semester.project.database;

import com.google.gson.reflect.TypeToken;
import semester.project.bean.User;
import semester.project.util.GsonHelper;
import semester.project.util.Lo;

import java.util.ArrayList;
import java.util.Arrays;

public class UserDBController {
            private static final String PATH = "../webapps/SemesterProject/database/users.json";
//    private static final String PATH = "database/users.json";

    ///////////////////////// CREATE /////////////////////////
    public static synchronized boolean addUser(User newUser) {
        ArrayList<User> users = getUsers();
        return users.add(newUser) && GsonHelper.saveObjectsToFile(users, PATH);
    }

    public static void main(String[] args) {
        Lo.g(getUserWithIdentifier("asdf").toString());
        Lo.g(Arrays.toString(getUsers().toArray()));
    }

    ///////////////////////// READ /////////////////////////
    public static synchronized ArrayList<User> getUsers() { //READ
        return GsonHelper.getObjectsFromFile(PATH, new TypeToken<ArrayList<User>>() {
        }.getType());
    }

    public static synchronized User getUserWithIdentifier(String identifier) {
        ArrayList<User> users = getUsers();
        for (User user : users) {
            if (identifier.equals(user.getIdentifier())) {
                return user;
            }
        }

        return null;
    }

    public static synchronized User getUserWithUsername(String username) {
        for (User user : getUsers()) {
            if (username.equals(user.getUsername())) {
                return user;
            }
        }

        return null;
    }

    ///////////////////////// UPDATE /////////////////////////
    public static synchronized boolean saveUsers(ArrayList<User> users) {
        return GsonHelper.saveObjectsToFile(users, PATH);
    }

    public static synchronized boolean updateUser(User updatedUser) {
        ArrayList<User> users = getUsers();

        for (User user : users) {
            if (updatedUser.getIdentifier().equals(user.getIdentifier())) {
                return deleteUser(user) && addUser(updatedUser);
            }
        }

        return false;
    }

    ///////////////////////// DELETE /////////////////////////
    public static synchronized boolean deleteUser(User userToBeDeleted) {
        ArrayList<User> users = getUsers();

        for (User user : users) {
            if (userToBeDeleted.getIdentifier().equals(user.getIdentifier())) {
                return users.remove(user) && saveUsers(users);
            }
        }
        return true;
    }
}
