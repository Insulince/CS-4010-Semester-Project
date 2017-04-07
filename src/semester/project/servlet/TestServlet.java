package semester.project.servlet;

import semester.project.bean.User;
import semester.project.db.UserDB;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class TestServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String url;
        String action = request.getParameter("action");
        if (action == null) {
            action = "join";
        }

        switch (action) {
            case "join":
                url = "/home.jsp";
                break;
            case "add":
                String firstName = request.getParameter("firstName");
                String lastName = request.getParameter("lastName");
                User user = new User(firstName, lastName);
                UserDB.insert(user);
                request.setAttribute("user", user);
                url = "/receipt.jsp";
                break;
            default:
                url = "/error.jsp";
                break;
        }

        this.getServletContext().getRequestDispatcher(url).forward(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doPost(request, response);
    }
}
