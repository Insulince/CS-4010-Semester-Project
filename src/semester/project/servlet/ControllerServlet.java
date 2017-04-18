package semester.project.servlet;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.ParseException;
import semester.project.database.DBController;
import semester.project.util.ForwardObject;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.function.Consumer;

public class ControllerServlet extends HttpServlet {
    private static final Consumer<ForwardObject> FORWARD_TO = ForwardObject::forwardTo;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        if (request.getAttribute("authorized").equals("true")) {
            String action = request.getParameter("action");

            switch (action) {
                case "go-to-login":
                    FORWARD_TO.accept(new ForwardObject("./views/login.jsp", request, response));
                    break;
                case "login":
                    FORWARD_TO.accept(new ForwardObject("./views/home.jsp", request, response));
                    break;
                case "go-to-register":
                    FORWARD_TO.accept(new ForwardObject("./views/register.jsp", request, response));
                    break;
                case "register":
                    register(request, response);
                    FORWARD_TO.accept(new ForwardObject("./views/registered.jsp", request, response));
                    break;
                default:
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
        String proposedUsername = request.getParameter("username");
        String password = request.getParameter("password");
        String email = request.getParameter("email");


        JSONArray users = DBController.getUsers();

        boolean uniqueUsername = true;
        for (Object userObj : users) {
            JSONObject user = (JSONObject) userObj;

            if (user.get("username") == proposedUsername) {
                uniqueUsername = false;
                break;
            }
        }

        if (uniqueUsername) {
            JSONObject newUser = new JSONObject();
            newUser.put("username", proposedUsername);
            newUser.put("password", password);
            newUser.put("email", email);

            if (DBController.addUser(newUser)) {
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
}
