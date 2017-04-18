package semester.project.servlet;

import semester.project.bean.User;
import semester.project.database.UserDBController;
import semester.project.util.ForwardObject;
import semester.project.util.Lo;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.function.Consumer;

public class ControllerServlet extends HttpServlet {
    private static final Consumer<ForwardObject> FORWARD_TO = ForwardObject::forwardTo;
    private static User currentUser;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        if (request.getAttribute("authorized").equals("true")) {
            String action = request.getParameter("action");

            String userIdentifier = request.getParameter("userIdentifier");
            currentUser = userIdentifier == null ? null : UserDBController.getUserWithIdentifier(userIdentifier);

            switch (action) {
                case "go-to-register":
                    FORWARD_TO.accept(new ForwardObject("./views/register.jsp", request, response));
                    break;
                case "register":
                    register(request, response);
                    FORWARD_TO.accept(new ForwardObject("./views/registered.jsp", request, response));
                    break;
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
                case "go-to-home":
                    if (currentUser != null) {
                        request.setAttribute("user", currentUser);
                        FORWARD_TO.accept(new ForwardObject("./views/home.jsp", request, response));
                    } else {
                        FORWARD_TO.accept(new ForwardObject("./views/login.jsp", request, response));
                    }
                    break;
                default:
                    if (userIdentifier != null) {
                        request.setAttribute("user", currentUser);
                    }
                    FORWARD_TO.accept(new ForwardObject("./views/error.jsp", request, response));
                    break;
            }
        } else {
            FORWARD_TO.accept(new ForwardObject("./views/error.jsp", request, response));
        }
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
