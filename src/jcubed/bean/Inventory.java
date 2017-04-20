package jcubed.bean;

import java.io.Serializable;
import java.util.ArrayList;

public class Inventory implements Serializable {
    private ArrayList<Item> items;

    public Inventory(ArrayList<Item> inventory) {
        this.items = inventory;
    }

    public Inventory() {
        this.items = null;
    }

    public ArrayList<Item> getItems() {
        return items;
    }

    public void setItems(ArrayList<Item> items) {
        this.items = items;
    }
}
