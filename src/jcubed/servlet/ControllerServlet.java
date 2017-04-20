package jcubed.servlet;

import jcubed.util.ForwardObject;
import jcubed.bean.Inventory;
import jcubed.bean.Item;
import jcubed.bean.User;
import jcubed.database.ItemDBController;
import jcubed.database.UserDBController;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.function.Consumer;

@SuppressWarnings("Duplicates")
public class ControllerServlet extends HttpServlet {
    private static final Consumer<ForwardObject> FORWARD_TO = ForwardObject::forwardTo;
    private static User currentUser;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        if (request.getAttribute("authorized").equals("true")) {
            String action = request.getParameter("action");

            currentUser = null;
            String userIdentifier = request.getParameter("userIdentifier");
            if (userIdentifier != null) {
                currentUser = UserDBController.getUserWithIdentifier(userIdentifier);
            }

            if (currentUser != null) { //When logged in, these are visible
                request.setAttribute("user", currentUser);
                switch (action) {
                    case "go-to-home":
                        FORWARD_TO.accept(new ForwardObject("./views/home.jsp", request, response));
                        break;
                    case "go-to-store":
                        request.setAttribute("inventory", new Inventory(ItemDBController.getItems()));
                        FORWARD_TO.accept(new ForwardObject("./views/store.jsp", request, response));
                        break;
                    case "view-item":
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
                        break;
                    case "next-item":
                        Item nextItem = ItemDBController.getItemWithIdentifier(request.getParameter("nextIdentifier"));
                        if (nextItem != null) {
                            request.setAttribute("item", nextItem);
                            FORWARD_TO.accept(new ForwardObject("./views/item.jsp", request, response));
                        } else {
                            request.setAttribute("inventory", new Inventory(ItemDBController.getItems()));
                            FORWARD_TO.accept(new ForwardObject("./views/store.jsp", request, response));
                        }
                        break;
                    case "previous-item":
                        Item previousItem = ItemDBController.getItemWithIdentifier(request.getParameter("previousIdentifier"));
                        if (previousItem != null) {
                            request.setAttribute("item", previousItem);
                            FORWARD_TO.accept(new ForwardObject("./views/item.jsp", request, response));
                        } else {
                            request.setAttribute("inventory", new Inventory(ItemDBController.getItems()));
                            FORWARD_TO.accept(new ForwardObject("./views/store.jsp", request, response));
                        }
                        break;
                    case "random":
                        Item item = ItemDBController.getRandomItem();
                        if (item != null) {
                            request.setAttribute("item", item);
                            FORWARD_TO.accept(new ForwardObject("./views/item.jsp", request, response));
                        } else {
                            FORWARD_TO.accept(new ForwardObject("./views/error.jsp", request, response));
                        }
                        break;
                    default:
                        FORWARD_TO.accept(new ForwardObject("./views/error.jsp", request, response));
                        break;
                }
            } else {
                switch (action) { //When not logged in, these are visible
                    case "go-to-register":
                        FORWARD_TO.accept(new ForwardObject("./views/register.jsp", request, response));
                        break;
                    case "register":
                        register(request, response);
                        FORWARD_TO.accept(new ForwardObject("./views/registered.jsp", request, response));
                        break;
                    case "go-to-home":
                    case "go-to-login":
                        FORWARD_TO.accept(new ForwardObject("./views/login.jsp", request, response));
                        break;
                    case "login":
                        login(request, response);
                        if (currentUser != null && !((boolean) request.getAttribute("loginFail"))) {
                            request.setAttribute("user", currentUser);
                            FORWARD_TO.accept(new ForwardObject("./views/home.jsp", request, response));
                        } else {
                            FORWARD_TO.accept(new ForwardObject("./views/login.jsp", request, response));
                        }
                        break;
                    default:
                        FORWARD_TO.accept(new ForwardObject("./views/error.jsp", request, response));
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
                request.setAttribute("message", "Invalid username and/or password! (pass)");
            }
        } else {
            request.setAttribute("loginFail", true);
            request.setAttribute("message", "Invalid username and/or password! (user)");
        }
    }
}
