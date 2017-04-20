package semester.project.database;

import com.google.gson.reflect.TypeToken;
import semester.project.bean.Item;
import semester.project.util.GsonHelper;
import semester.project.util.Lo;

import java.util.ArrayList;
import java.util.Arrays;

public class ItemDBController {
    private static final String PATH = "../webapps/SemesterProject/database/items.json";
//    private static final String PATH = "database/items.json";

    ///////////////////////// CREATE /////////////////////////
    public static synchronized boolean addItem(Item newItem) {
        ArrayList<Item> items = getItems();
        return items.add(newItem) && GsonHelper.saveObjectsToFile(items, PATH);
    }

    public static void main(String[] args) {
//        addItem(new Item("a", 5.50, 3, "description", "./images/pic.png"));
//        addItem(new Item("b", 5.75, 0, "description 2", "./images/pic2.png"));
//        addItem(new Item("c", 5.95, 30, "description 3", "./images/pic3.png"));
//        Lo.g(getItemWithIdentifier("asdf").toString());
        Lo.g(Arrays.toString(getItems().toArray()));
    }

    ///////////////////////// READ /////////////////////////
    public static synchronized ArrayList<Item> getItems() { //READ
        return (ArrayList<Item>) GsonHelper.getObjectsFromFile(PATH, new TypeToken<ArrayList<Item>>() {
        }.getType());
    }

    public static synchronized Item getItemWithIdentifier(String identifier) {
        ArrayList<Item> items = getItems();
        for (Item item : items) {
            if (identifier.equals(item.getIdentifier())) {
                return item;
            }
        }

        return null;
    }

    public static synchronized Item getItemWithName(String name) {
        for (Item item : getItems()) {
            if (name.equals(item.getName())) {
                return item;
            }
        }

        return null;
    }

    ///////////////////////// UPDATE /////////////////////////
    public static synchronized boolean saveItems(ArrayList<Item> items) {
        return GsonHelper.saveObjectsToFile(items, PATH);
    }

    public static synchronized boolean updateItem(Item updatedItem) {
        ArrayList<Item> items = getItems();

        for (Item item : items) {
            if (updatedItem.getIdentifier().equals(item.getIdentifier())) {
                return deleteItem(item) && addItem(updatedItem);
            }
        }

        return false;
    }

    ///////////////////////// DELETE /////////////////////////
    public static synchronized boolean deleteItem(Item itemToBeDeleted) {
        ArrayList<Item> items = getItems();

        for (Item item : items) {
            if (itemToBeDeleted.getIdentifier().equals(item.getIdentifier())) {
                return items.remove(item) && saveItems(items);
            }
        }
        return true;
    }
}
