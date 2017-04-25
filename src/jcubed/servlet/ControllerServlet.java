package jcubed.servlet;

import jcubed.util.ForwardObject;
import jcubed.bean.Item;
import jcubed.bean.User;
import jcubed.database.ItemDBController;
import jcubed.database.UserDBController;
import jcubed.util.Lo;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;
import java.util.function.Consumer;

public class ControllerServlet extends HttpServlet {
    private static final Consumer<ForwardObject> FORWARD_TO = ForwardObject::forwardTo;
    private static final long startOfFeatureCycleDate = new Date(1492855200000L).getTime() / 86400000; //Days between 1970-01-01 12:00:00AM UTC and 2017-04-22 12:00:00AM CST
    private static User currentUser;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setAttribute("sharedHeaderTags", "" +
                "    <link href=\"/j-cubed/views/main.css\" rel=\"stylesheet\"/>\n" +
                "    <link href=\"https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css\" rel=\"stylesheet\" integrity=\"sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u\" crossorigin=\"anonymous\"/>\n" +
                "    <script src=\"https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js\"></script>\n" +
                "    <script src=\"https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js\" integrity=\"sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa\" crossorigin=\"anonymous\"></script>");

        if (request.getAttribute("authorized") != null && request.getAttribute("authorized").equals("true")) {
            String action = request.getParameter("action");

            currentUser = null;
            String userIdentifier = request.getParameter("userIdentifier");
            if (userIdentifier != null) {
                currentUser = UserDBController.getUserWithIdentifier(userIdentifier);
            }

            if (currentUser != null) { //When logged in, these are visible
                request.setAttribute("user", currentUser);
                switch (action) {
                    case "go-to-home": {
                        getHomeDetails(request);
                        FORWARD_TO.accept(new ForwardObject("./views/home.jsp", request, response));
                    }
                    break;
                    case "go-to-store": {
                        request.setAttribute("inventory", ItemDBController.getItems());
                        FORWARD_TO.accept(new ForwardObject("./views/store.jsp", request, response));
                    }
                    break;
                    case "view-item": {
                        String itemIdentifier = request.getParameter("itemIdentifier");
                        if (itemIdentifier != null && !itemIdentifier.equals("")) {
                            Item item = ItemDBController.getItemWithIdentifier(itemIdentifier);
                            if (item != null) {
                                request.setAttribute("item", item);
                                FORWARD_TO.accept(new ForwardObject("./views/item.jsp", request, response));
                            } else {
                                FORWARD_TO.accept(new ForwardObject("./views/error.jsp", request, response));
                            }
                        } else {
                            FORWARD_TO.accept(new ForwardObject("./views/error.jsp", request, response));
                        }
                    }
                    break;
                    case "next-item": {
                        Item nextItem = ItemDBController.getItemWithIdentifier(request.getParameter("nextIdentifier"));
                        if (nextItem != null) {
                            request.setAttribute("item", nextItem);
                            FORWARD_TO.accept(new ForwardObject("./views/item.jsp", request, response));
                        } else {
                            request.setAttribute("inventory", ItemDBController.getItems());
                            FORWARD_TO.accept(new ForwardObject("./views/store.jsp", request, response));
                        }
                    }
                    break;
                    case "previous-item": {
                        Item previousItem = ItemDBController.getItemWithIdentifier(request.getParameter("previousIdentifier"));
                        if (previousItem != null) {
                            request.setAttribute("item", previousItem);
                            FORWARD_TO.accept(new ForwardObject("./views/item.jsp", request, response));
                        } else {
                            request.setAttribute("inventory", ItemDBController.getItems());
                            FORWARD_TO.accept(new ForwardObject("./views/store.jsp", request, response));
                        }
                    }
                    break;
                    case "random": {
                        Item item = ItemDBController.getRandomItem();
                        if (item != null) {
                            request.setAttribute("item", item);
                            FORWARD_TO.accept(new ForwardObject("./views/item.jsp", request, response));
                        } else {
                            FORWARD_TO.accept(new ForwardObject("./views/error.jsp", request, response));
                        }
                    }
                    break;
                    case "go-to-my-account": {
                        request.setAttribute("mode", "view");
                        FORWARD_TO.accept(new ForwardObject("./views/my-account.jsp", request, response));
                    }
                    break;
                    case "go-to-my-cart": {
                        FORWARD_TO.accept(new ForwardObject("./views/my-cart.jsp", request, response));
                    }
                    break;
                    case "add-to-cart-from-store": {
                        if (UserDBController.addItemToCart(ItemDBController.getItemWithIdentifier(request.getParameter("itemIdentifier")), UserDBController.getUserWithIdentifier(request.getParameter("userIdentifier")))) {
                            request.setAttribute("addedToCart", "yes");
                        } else {
                            request.setAttribute("addedToCart", "no");
                        }
                        request.setAttribute("requestedItem", ItemDBController.getItemWithIdentifier(request.getParameter("itemIdentifier")));
                        request.setAttribute("inventory", ItemDBController.getItems());
                        request.setAttribute("user", UserDBController.getUserWithIdentifier(request.getParameter("userIdentifier"))); //Must be re-set so that the changes to the cart take effect immediately.
                        FORWARD_TO.accept(new ForwardObject("./views/store.jsp", request, response));

                    }
                    break;
                    case "add-to-cart-from-item": {
                        if (UserDBController.addItemToCart(ItemDBController.getItemWithIdentifier(request.getParameter("itemIdentifier")), UserDBController.getUserWithIdentifier(request.getParameter("userIdentifier")))) {
                            request.setAttribute("addedToCart", "yes");
                        } else {
                            request.setAttribute("addedToCart", "no");
                        }
                        request.setAttribute("requestedItem", ItemDBController.getItemWithIdentifier(request.getParameter("itemIdentifier")));
                        request.setAttribute("item", ItemDBController.getItemWithIdentifier(request.getParameter("itemIdentifier")));
                        request.setAttribute("user", UserDBController.getUserWithIdentifier(request.getParameter("userIdentifier"))); //Must be re-set so that the changes to the cart take effect immediately.
                        FORWARD_TO.accept(new ForwardObject("./views/item.jsp", request, response));
                    }
                    break;
                    case "add-to-cart-from-home": {
                        if (UserDBController.addItemToCart(ItemDBController.getItemWithIdentifier(request.getParameter("itemIdentifier")), UserDBController.getUserWithIdentifier(request.getParameter("userIdentifier")))) {
                            request.setAttribute("addedToCart", "yes");
                        } else {
                            request.setAttribute("addedToCart", "no");
                        }
                        request.setAttribute("requestedItem", ItemDBController.getItemWithIdentifier(request.getParameter("itemIdentifier")));
                        getHomeDetails(request);
                        request.setAttribute("user", UserDBController.getUserWithIdentifier(request.getParameter("userIdentifier"))); //Must be re-set so that the changes to the cart take effect immediately.
                        FORWARD_TO.accept(new ForwardObject("./views/home.jsp", request, response));
                    }
                    break;
                    case "remove-item-from-cart": {
                        if (UserDBController.removeItemFromCart(ItemDBController.getItemWithIdentifier(request.getParameter("itemIdentifier")), UserDBController.getUserWithIdentifier(request.getParameter("userIdentifier")))) {
                            request.setAttribute("removedFromCart", "yes");
                        } else {
                            request.setAttribute("removedFromCart", "no");
                        }
                        request.setAttribute("requestedItem", ItemDBController.getItemWithIdentifier(request.getParameter("itemIdentifier")));
                        request.setAttribute("user", UserDBController.getUserWithIdentifier(request.getParameter("userIdentifier"))); //Must be re-set so that the changes to the cart take effect immediately.
                        FORWARD_TO.accept(new ForwardObject("./views/my-cart.jsp", request, response));
                    }
                    break;
                    case "go-to-checkout": {
                        FORWARD_TO.accept(new ForwardObject("./views/checkout.jsp", request, response));
                    }
                    break;
                    case "checkout": {
                        if (request.getParameter("updateInformation") != null) {
                            updateInformationFromCheckout(request);
                        }
                        request.setAttribute("orderedItems", currentUser.getCart());
                        UserDBController.emptyCart(currentUser);
                        request.setAttribute("user", currentUser); //Must be re-set so that the changes to the user's information and/or cart take effect immediately.
                        FORWARD_TO.accept(new ForwardObject("./views/order-placed.jsp", request, response));
                    }
                    break;
                    case "edit-my-account": {
                        request.setAttribute("mode", "edit");
                        FORWARD_TO.accept(new ForwardObject("./views/my-account.jsp", request, response));
                    }
                    break;
                    case "save-my-account": {
                        updateInformationFromMyAccount(request);
                        request.setAttribute("mode", "view");
                        request.setAttribute("message", "Details updated!");
                        FORWARD_TO.accept(new ForwardObject("./views/my-account.jsp", request, response));
                    }
                    break;
                    case "logout": {
                        request.setAttribute("user", null);
                        FORWARD_TO.accept(new ForwardObject("./views/login.jsp", request, response));
                    }
                    break;
                    default: {
                        FORWARD_TO.accept(new ForwardObject("./views/error.jsp", request, response));
                    }
                    break;
                }
            } else {
                switch (action) { //When not logged in, these are visible
                    case "go-to-register": {
                        FORWARD_TO.accept(new ForwardObject("./views/register.jsp", request, response));
                    }
                    break;
                    case "register": {
                        register(request, response);
                        FORWARD_TO.accept(new ForwardObject("./views/registered.jsp", request, response));
                    }
                    break;
                    case "go-to-home": {
                    }
                    case "go-to-login": {
                        FORWARD_TO.accept(new ForwardObject("./views/login.jsp", request, response));
                    }
                    break;
                    case "login": {
                        login(request, response);
                        if (currentUser != null && !((boolean) request.getAttribute("loginFail"))) {
                            request.setAttribute("user", currentUser);
                            getHomeDetails(request);
                            FORWARD_TO.accept(new ForwardObject("./views/home.jsp", request, response));
                        } else {
                            FORWARD_TO.accept(new ForwardObject("./views/login.jsp", request, response));
                        }
                    }
                    break;
                    default: {
                        FORWARD_TO.accept(new ForwardObject("./views/error.jsp", request, response));
                    }
                    break;
                }
            }
        } else {
            FORWARD_TO.accept(new ForwardObject("./views/error.jsp", request, response));
        }
        currentUser = null;
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }

    private void getHomeDetails(HttpServletRequest request) {
        request.setAttribute("dailyItem", ItemDBController.getRandomItem(new Date().getTime() / 86400000 - startOfFeatureCycleDate));
    }

    private void updateInformationFromMyAccount(HttpServletRequest request) {
        currentUser.setEmail(request.getParameter("email"));
        currentUser.setFirstName(request.getParameter("firstName"));
        currentUser.setMiddleName(request.getParameter("middleName"));
        currentUser.setLastName(request.getParameter("lastName"));
        currentUser.setDateOfBirth(request.getParameter("dateOfBirth"));
        currentUser.setGender(request.getParameter("gender"));
        currentUser.setAddress(request.getParameter("address"));
        currentUser.setCity(request.getParameter("city"));
        currentUser.setState(request.getParameter("state"));
        currentUser.setZipCode(request.getParameter("zipCode"));
        currentUser.setCreditCardNumber(request.getParameter("creditCardNumber") != null ? (!request.getParameter("creditCardNumber").equals("0000000000000000") ? request.getParameter("creditCardNumber") : currentUser.getCreditCardNumber()) : currentUser.getCreditCardNumber());
        UserDBController.updateUser(currentUser);
    }

    private void updateInformationFromCheckout(HttpServletRequest request) {
        Lo.g(request.getParameter("address"));
        currentUser.setAddress(request.getParameter("address"));
        currentUser.setCity(request.getParameter("city"));
        currentUser.setState(request.getParameter("state"));
        currentUser.setZipCode(request.getParameter("zip-code"));
        UserDBController.updateUser(currentUser);
    }

    private void register(HttpServletRequest request, HttpServletResponse response) {
        User proposedUser = new User(request.getParameter("username"), request.getParameter("password"), request.getParameter("email"));

        ArrayList<User> users = UserDBController.getUsers();

        boolean uniqueUsername = true;
        for (User user : users) {
            if (proposedUser.getUsername().equals(user.getUsername())) {
                uniqueUsername = false;
                break;
            }
        }

        if (uniqueUsername) {
            if (UserDBController.addUser(proposedUser)) {
                request.setAttribute("registered", true);
                request.setAttribute("message", "You have successfully registered! Please log in.");
            } else {
                request.setAttribute("registered", false);
                request.setAttribute("message", "Internal server error, we couldn't update the list of users! Try again!");
            }
        } else {
            request.setAttribute("registered", false);
            request.setAttribute("message", "Your username is not unique, please try a different one!");
        }
    }

    private void login(HttpServletRequest request, HttpServletResponse response) {
        String username = request.getParameter("username");
        String password = request.getParameter("password");

        User fetchedUser = UserDBController.getUserWithUsername(username);

        if (fetchedUser != null) {
            if (fetchedUser.getPassword().equals(password)) {
                currentUser = fetchedUser;
                request.setAttribute("userIdentifier", fetchedUser.getIdentifier());
                request.setAttribute("loginFail", false);
                request.setAttribute("message", "Welcome " + username);
            } else {
                request.setAttribute("loginFail", true);
                request.setAttribute("message", "Invalid username and/or password!");
            }
        } else {
            request.setAttribute("loginFail", true);
            request.setAttribute("message", "Invalid username and/or password!");
        }
    }
}
