package jcubed.bean;

import jcubed.database.UserDBController;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.Random;
import java.util.stream.Collectors;

public class User implements Serializable {
    private static final int USER_IDENTIFIER_LENGTH = 32;

    private final String identifier;
    private String username;
    private String password;
    private String email;
    private ArrayList<Item> cart;
    private String firstName;
    private String middleName;
    private String lastName;
    private String dateOfBirth;
    private String gender;
    private String address;
    private String city;
    private String state;
    private String zipCode;
    private String creditCardNumber;

    public User(String username, String password, String email) {
        this.identifier = generateRandomIdentifier();
        this.username = username;
        this.password = password;
        this.email = email;
        this.cart = new ArrayList<>();
        this.firstName = "";
        this.middleName = "";
        this.lastName = "";
        this.dateOfBirth = "";
        this.gender = "";
        this.address = "";
        this.city = "";
        this.state = "";
        this.zipCode = "";
        this.creditCardNumber = "";
    }

    public User() {
        this.identifier = "";
        this.username = "";
        this.password = "";
        this.email = "";
        this.cart = null;
        this.firstName = "";
        this.middleName = "";
        this.lastName = "";
        this.dateOfBirth = "";
        this.gender = "";
        this.address = "";
        this.city = "";
        this.state = "";
        this.zipCode = "";
        this.creditCardNumber = "";
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

    public ArrayList<Item> getCart() {
        return cart;
    }

    public void setCart(ArrayList<Item> cart) {
        this.cart = cart;
    }

    public String getFirstName() {
        return firstName;
    }

    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }

    public String getMiddleName() {
        return middleName;
    }

    public void setMiddleName(String middleName) {
        this.middleName = middleName;
    }

    public String getLastName() {
        return lastName;
    }

    public void setLastName(String lastName) {
        this.lastName = lastName;
    }

    public String getDateOfBirth() {
        return dateOfBirth;
    }

    public void setDateOfBirth(String dateOfBirth) {
        this.dateOfBirth = dateOfBirth;
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getCity() {
        return city;
    }

    public void setCity(String city) {
        this.city = city;
    }

    public String getState() {
        return state;
    }

    public void setState(String state) {
        this.state = state;
    }

    public String getZipCode() {
        return zipCode;
    }

    public void setZipCode(String zipCode) {
        this.zipCode = zipCode;
    }

    public String getCreditCardNumber() {
        return creditCardNumber;
    }

    public void setCreditCardNumber(String creditCardNumber) {
        this.creditCardNumber = creditCardNumber;
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