package jcubed.util;

import com.google.gson.Gson;
import com.google.gson.stream.JsonReader;

import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;
import java.lang.reflect.Type;
import java.util.ArrayList;

public class GsonHelper {
    private static final Gson GSON = new Gson();
    private static final boolean DO_NOT_APPEND = false;

    public static synchronized boolean saveObjectsToFile(ArrayList object, String filePath) {
        try {
            FileWriter fileWriter = new FileWriter(filePath, DO_NOT_APPEND);
            fileWriter.write(GSON.toJson(object));
            fileWriter.flush();
            fileWriter.close();

            return true;
        } catch (IOException e) {
            e.printStackTrace();
        }

        return false;
    }

    public static synchronized ArrayList getObjectsFromFile(String filePath, Type objectType) {
        try {
            JsonReader reader = new JsonReader(new FileReader(filePath));
            return GSON.fromJson(reader, objectType);
        } catch (IOException e) {
            e.printStackTrace();
        }

        return null;
    }
}
