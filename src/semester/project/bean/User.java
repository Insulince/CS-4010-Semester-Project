package semester.project.bean;

import semester.project.database.UserDBController;

import java.io.Serializable;
import java.util.Random;
import java.util.stream.Collectors;

public class User implements Serializable {
    private static final int USER_IDENTIFIER_LENGTH = 32;

    private final String identifier;
    private String username;
    private String password;
    private String email;

    public User(String username, String password, String email) {
        this.identifier = generateRandomIdentifier();
        this.username = username;
        this.password = password;
        this.email = email;
    }

    public User() {
        this.identifier = "";
        this.username = "";
        this.password = "";
        this.email = "";
    }

    public String getIdentifier() {
        return identifier;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    @Override
    public String toString() {
        return "User{" +
                "identifier=\"" + identifier + "\"" +
                ", username=\"" + username + "\"" +
                ", password=\"" + password + "\"" +
                ", email=\"" + email + "\"" +
                "}";
    }

    private static String generateRandomIdentifier() {
        boolean unique = false;
        String identifier = "";

        while (!unique) {
            unique = true;

            identifier = new Random()
                    .ints(0, 52)
                    .limit(USER_IDENTIFIER_LENGTH)
                    .mapToObj((character) -> Character.toString((char) (character < 26 ? character + 'A' : character + 'a' - 26)))
                    .collect(Collectors.joining());

            for (User user : UserDBController.getUsers()) {
                if (identifier.equals(user.getIdentifier())) {
                    unique = false;
                }
            }
        }

        return identifier;
    }
}