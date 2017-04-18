package semester.project.database;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import semester.project.util.Lo;

import java.io.File;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;

public class DBController {
    private static final boolean DO_NOT_APPEND = false;

    public static void main(String[] args) {
        Lo.g(getBasePath());
    }

    public static synchronized JSONArray getUsers() {
        JSONParser jsonParser = new JSONParser();

        try {
            return (JSONArray) jsonParser.parse(new FileReader("../webapps/SemesterProject/database/users.json")); //TODO: This is garbage, find a better way to handle the relative paths.
        } catch (IOException | ParseException e) {
            e.printStackTrace();
        }

        throw new RuntimeException("Could not get users!");
    }

    public static synchronized boolean addUser(JSONObject newUser) {
        JSONArray users = getUsers();
        users.add(newUser);

        try (FileWriter fileWriter = new FileWriter("../webapps/SemesterProject/database/users.json", DO_NOT_APPEND)) { //TODO: Same thing here.
            fileWriter.write(users.toJSONString());
            fileWriter.flush();
            fileWriter.close();

            return true;
        } catch (IOException e) {
            e.printStackTrace();
        }

        return false;
    }

    private static synchronized String getBasePath() {
        return new File("").getAbsolutePath();
    }
}
