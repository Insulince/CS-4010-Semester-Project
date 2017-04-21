package jcubed.database;

import com.google.gson.reflect.TypeToken;
import jcubed.bean.Item;
import jcubed.bean.User;
import jcubed.util.GsonHelper;
import jcubed.util.Lo;

import java.util.ArrayList;
import java.util.Random;

public class ItemDBController {
    private static final String PATH = "../webapps/j-cubed/database/items.json";
//    private static final String PATH = "database/items.json";

    public static void main(String[] args) {
        addItem(new Item("1x1 Pyraminx", 2.99, 10, "The smallest and most trivial of the pyramidal puzzles. Comes pre-solved!", "pyraminx-1x1.jpg"));
        addItem(new Item("2x2 Pyraminx", 12.99, 4, "While this puzzle is possible to \"scramble\", you will find that there are only three moving parts and should be able to solve it very easilly! Still a great addition for collectors!", "pyraminx-2x2.jpg"));
        addItem(new Item("Original Pyraminx (3x3 Pyraminx)", 7.19, 12, "The traditional Pyraminx puzzle. It turns on its 4 exes stemming inwards from each tip of the puzzle. Watch as the pieces get quickly mixed up and try to put them back!", "pyraminx.jpg"));
        addItem(new Item("4x4 Pyraminx", 17.99, 3, "The next higher order puzzle from the traditional Pyraminx. Good luck with this one.", "pyraminx-4x4.jpg"));
        addItem(new Item("5x5 Pyraminx", 44.27, 2, "The largest pyramidal puzzle in existence today, this puzzle requires serious discipline to master. Notice the curved shape, it must be designed that way to accommodate all the pieces!", "pyraminx-5x5.jpg"));
        addItem(new Item("1x1 Cube", 2.99, 9, "The smallest and most trivial of the cubic puzzles. Comes pre-solved!", "1x1.jpg"));
        addItem(new Item("2x2 Cube", 5.99, 22, "Some mistake this as an easy puzzle since it's smaller than the traditional Rubik's cube. While they are correct that it has less pieces, they will find themselves lost if they try to unscramble it!", "2x2.jpg"));
        addItem(new Item("Rubik's Cube (3x3 Cube)", 9.99, 45, "The traditional twisty puzzle from the '80s. Twist it and watch as the colors get increasingly mixed up then test your skill at unscrambling it.", "rubiks-cube.jpg"));
        addItem(new Item("4x4 Cube", 10.99, 13, "54 stickers not enough for you? Try out this next level puzzle with 96 stickers!", "4x4.jpg"));
        addItem(new Item("5x5 Cube", 11.99, 7, "At two orders of magnitude larger than the original Rubik's Cube, this cube has 150 stickers.", "5x5.jpg"));
        addItem(new Item("6x6 Cube", 17.79, 7, "At three orders of magnitude larger than the original Rubik's Cube, this cube has 216 stickers.", "6x6.jpg"));
        addItem(new Item("7x7 Cube", 21.99, 5, "At four orders of magnitude larger than the original Rubik's Cube, this cube has 294 stickers.", "7x7.jpg"));
        addItem(new Item("8x8 Cube", 49.94, 3, "At five orders of magnitude larger than the original Rubik's Cube, this cube has 384 stickers.", "8x8.jpg"));
        addItem(new Item("9x9 Cube", 65.45, 3, "At a whopping six orders of magnitude larger than the original Rubik's Cube, this cube has 486 stickers.", "9x9.jpg"));
        addItem(new Item("11x11 Cube", 122.99, 1, "This cube is so large that its predecessor (the 10x10 cube) can't even be built because it lacks the necessary structure found in odd-numbered cubes. It has 726 stickers! Good luck!", "11x11.jpg"));
        addItem(new Item("Monominx (1x1 Megaminx)", 2.99, 4, "The smallest and most trivial of the dodecahedral puzzles. Comes pre-solved!", "monominx.jpg"));
        addItem(new Item("2x2 Megaminx", 8.49, 0, "A smaller feat than the traditional Megaminx, but make no mistake, you can easily get lost in it!", "megaminx-2x2.jpg"));
        addItem(new Item("Original Megaminx (3x3 Megaminx)", 15.99, 8, "The traditional Megaminx. Its a dodecahedron shaped puzzle with 50 moving pieces. It shares a lot of similarities with the original Rubik's cube, but also contains mysteries of its own.", "megaminx.jpg"));
        addItem(new Item("Kilominx (4x4 Megaminx)", 38.88, 4, "This puzzle compares to the original Megaminx is equivalent to the comparison between a 4x4 Cube and an original Rubik's cube.", "kilominx.jpg"));
        addItem(new Item("Gigaminx (5x5 Megaminx)", 39.99, 5, "At two orders of magnitude larger than the original Megaminx, this puzzle has 372 stickers.", "gigaminx.jpg"));
        addItem(new Item("Teraminx (7x7 Megaminx)", 78.99, 3, "At four orders of magnitude larger than the original Megaminx, this puzzle has 732 stickers.", "teraminx.jpg"));
        addItem(new Item("Petaminx (9x9 Megaminx)", 207.79, 2, "At five orders of magnitude larger than the original Megaminx, this puzzle has 1,212 stickers.", "petaminx.jpg"));
        addItem(new Item("Zetaminx (13x13 Megaminx)", 422.99, 0, "At nine orders of magnitude larger than the original Megaminx, this puzzle has 2,532 stickers.", "zetaminx.jpg"));
        addItem(new Item("Yottaminx (15x15 Megaminx)", 718.99, 2, "At an incredible eleven orders of magnitude larger than the original Megaminx, this puzzle has startling 3,372 stickers. You're gonna need a day or two for this one", "yottaminx.jpg"));
        addItem(new Item("Skewb", 7.95, 10, "A classic favorite. The Skewb slides along an axis underneath each of its corners, causing the corners to shuffle while leaving the centers mostly in place.", "skewb.jpg"));
        addItem(new Item("Master Skewb", 10.44, 3, "Considered to be the next level above the Skewb, this puzzle adds the new challenge of not only fixing the corners, but now the centers as well.", "master-skewb.jpg"));
        addItem(new Item("Square-1", 7.99, 6, "A puzzle which punishes you for not paying attention. You can only twist it if the correct pieces line up with the only slice down the cube. This can lead to some interesting combinations.", "square-1.jpg"));
        addItem(new Item("Square-2", 18.99, 2, "The next level after the Square-1, this cube adds extra pieces to make lining them up even harder.", "square-2.jpg"));
        addItem(new Item("Axis Cube", 5.89, 5, "This cube works by taking an original Rubik's cube, and pushing all the pieces out of whack. The centers become corners, the corners become edges, and the edges become centers.", "axis-cube.jpg"));
        addItem(new Item("Fisher Cube", 7.99, 3, "When you turn this puzzle, you will quickly find that it loses its familiar cube-like shape! Branded as a shape-shifter, this puzzle will confuse anyone!", "fisher-cube.jpg"));
        addItem(new Item("Helicopter Cube", 14.99, 5, "Twisting the edges causes the pieces to swag in a \"helicopter blade\" style, hence the name.", "helicopter-cube.jpg"));
        addItem(new Item("Windmill Cube", 7.88, 0, "A variation on the Axis Cube in which instead of moving the pieces to a corner, we simply rotate the edges on one axis, causing corners to become edges, and edges to become corners while leaving the centers untouched.", "windmill-cube.jpg"));
        addItem(new Item("Siamese Cube", 20.99, 6, "Two Rubik's cubes fused together along on corner, this will be a challenge to unscramble!", "siamese-cube.jpg"));
    }

    public static synchronized Item getRandomItem() {
        ArrayList<Item> items = getItems();

        return items.get(new Random().nextInt(items.size()));
    }

    public static synchronized Item getLastItem() {
        ArrayList<Item> items = getItems();

        if (items != null && items.size() != 0) {
            return items.get(items.size() - 1);
        } else {
            return null;
        }
    }

    public static synchronized boolean addItemToCart(Item item, User user) {
        if (item != null) {
            if (item.isAvailable()) {
                int newQuantity = item.getQuantity();
                --newQuantity;
                item.setQuantity(newQuantity);
                updateItem(item);

                ArrayList<Item> newCart = user.getCart();
                newCart.add(item);
                user.setCart(newCart);
                UserDBController.updateUser(user);

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
                    updateItem(item);

                    ArrayList<Item> newCart = user.getCart();
                    newCart.remove(i);
                    user.setCart(newCart);
                    UserDBController.updateUser(user);

                    return true;
                }
                i++;
            }

            return false;
        } else {
            return false;
        }
    }

    ///////////////////////// CREATE /////////////////////////
    public static synchronized boolean addItem(Item newItem) {
        ArrayList<Item> items = getItems();
        return items.add(newItem) && GsonHelper.saveObjectsToFile(items, PATH);
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
