package semester.project.bean;

import semester.project.database.ItemDBController;
import semester.project.database.UserDBController;

import java.io.Serializable;
import java.util.Random;
import java.util.stream.Collectors;

public class Item implements Serializable {
    private static final int ITEM_IDENTIFIER_LENGTH = 32;

    private final String identifier;
    private String name;
    private double price;
    private int quantity;
    private String description;
    private boolean available;
    private String imageUrl;

    public Item(String name, double price, int quantity, String description, String imageUrl) {
        this.identifier = generateRandomIdentifier();
        this.name = name;
        this.price = price;
        this.quantity = quantity;
        this.description = description;
        this.available = this.quantity > 0;
        this.imageUrl = imageUrl;
    }

    public Item() {
        this.identifier = "";
        this.name = "";
        this.price = 0;
        this.quantity = 0;
        this.description = "";
        this.available = false;
        this.imageUrl = "";
    }

    public String getIdentifier() {
        return identifier;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public boolean isAvailable() {
        return available;
    }

    public void setAvailable(boolean available) {
        this.available = available;
    }

    public String getImageUrl() {
        return imageUrl;
    }

    public void setImageUrl(String imageUrl) {
        this.imageUrl = imageUrl;
    }

    @Override
    public String toString() {
        return "Item{" +
                "identifier=\"" + identifier + "\"" +
                ", name=\"" + name + "\"" +
                ", price=" + price +
                ", quantity=" + quantity +
                ", description=\"" + description + "\"" +
                ", available=" + available +
                ", imageUrl=\"" + imageUrl + "\"" +
                "}";
    }

    private static String generateRandomIdentifier() {
        boolean unique = false;
        String identifier = "";

        while (!unique) {
            unique = true;

            identifier = new Random()
                    .ints(0, 52)
                    .limit(ITEM_IDENTIFIER_LENGTH)
                    .mapToObj((character) -> Character.toString((char) (character < 26 ? character + 'A' : character + 'a' - 26)))
                    .collect(Collectors.joining());

            for (Item item : ItemDBController.getItems()) {
                if (identifier.equals(item.getIdentifier())) {
                    unique = false;
                }
            }
        }

        return identifier;
    }
}
