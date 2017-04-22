package jcubed.database;

import com.google.gson.reflect.TypeToken;
import jcubed.bean.Item;
import jcubed.util.Lo;
import jcubed.bean.User;
import jcubed.util.GsonHelper;

import java.util.ArrayList;
import java.util.Arrays;

public class UserDBController {
            private static final String PATH = "../webapps/j-cubed/database/users.json";
//    private static final String PATH = "database/users.json";

    public static synchronized boolean addItemToCart(Item item, User user) {
        if (item != null) {
            if (item.isAvailable()) {
                int newQuantity = item.getQuantity();
                --newQuantity;
                item.setQuantity(newQuantity);
                ItemDBController.updateItem(item);

                ArrayList<Item> newCart = user.getCart();
                newCart.add(item);
                user.setCart(newCart);
                updateUser(user);

                return true;
            } else {
                return false;
            }
        } else {
            return false;
        }
    }

    public static synchronized boolean removeItemFromCart(Item item, User user) {
        if (item != null) {
            ArrayList<Item> usersCart = user.getCart();
            int i = 0;
            for (Item userItem : usersCart) {
                if (userItem.getIdentifier().equals(item.getIdentifier())) {
                    int newQuantity = item.getQuantity();
                    ++newQuantity;
                    item.setQuantity(newQuantity);
                    ItemDBController.updateItem(item);

                    ArrayList<Item> newCart = user.getCart();
                    newCart.remove(i);
                    user.setCart(newCart);
                    updateUser(user);

                    return true;
                }
                i++;
            }

            return false;
        } else {
            return false;
        }
    }

    public static synchronized boolean emptyCart(User user) {
        user.setCart(new ArrayList<>());

        return updateUser(user);
    }

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
        return (ArrayList<User>) GsonHelper.getObjectsFromFile(PATH, new TypeToken<ArrayList<User>>() {
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
