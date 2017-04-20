package jcubed.servlet;

import jcubed.util.ForwardObject;
import jcubed.util.Lo;
import jcubed.util.Session;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;
import java.util.function.Consumer;

public class SessionServlet extends HttpServlet {
    private static final Consumer<ForwardObject> FORWARD_TO = ForwardObject::forwardTo;
    private static final ArrayList<Session> SESSIONS = new ArrayList<>();

    private static Session currentSession;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Lo.g("\"POST /\" received.");

        request.setAttribute("sharedHeaderTags", "" +
                "    <link href=\"/j-cubed/views/main.css\" rel=\"stylesheet\"/>\n" +
                "    <link href=\"https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css\" rel=\"stylesheet\" integrity=\"sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u\" crossorigin=\"anonymous\"/>\n" +
                "    <script src=\"https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js\"></script>\n" +
                "    <script src=\"https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js\" integrity=\"sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa\" crossorigin=\"anonymous\"></script>");

        final String action = request.getParameter("action");
        Lo.g("Action = \"" + action + "\"");

        final String identifier = request.getParameter("identifier");
        Lo.g("Session identifier is \"" + identifier + "\".");

        if ((action == null || action.equals("")) || (identifier == null || identifier.equals(""))) {
            Lo.g("No action was found, therefore this user has no session, creating new session.");
            createNewSession();

            Lo.g("Assigning attribute \"identifier\" with value \"" + currentSession.getIdentifier() + "\" to request body.");
            request.setAttribute("identifier", currentSession.getIdentifier());

            Lo.g("Forwarding to \"./views/login.jsp\".");
            FORWARD_TO.accept(new ForwardObject("./views/login.jsp", request, response));
        } else {
            Lo.g("Action was found, therefore this user already has a session, now validating.");

            if (validateSession(identifier)) {
                Lo.g("Session is valid so authorizing this user.");

                Lo.g("Assigning attribute \"identifier\" with value \"" + currentSession.getIdentifier() + "\" to request body.");
                request.setAttribute("identifier", currentSession.getIdentifier());
                Lo.g("Assigning attribute \"authorized\" with value \"true\" to request body.");
                request.setAttribute("authorized", "true");

                Lo.g("Forwarding to \"/controller\".");
                FORWARD_TO.accept(new ForwardObject("/controller", request, response));
            } else {
                Lo.g("This session is invalid, so we cannot authorize this user.");

                String note = request.getParameter("note");
                if (note == null || !note.equals("leaving-error")) {
                    Lo.g("Forwarding to \"./views/error.jsp\".");
                    FORWARD_TO.accept(new ForwardObject("./views/error.jsp", request, response));
                } else {
                    Lo.g("User is already on the error page, so sending to \"./views/login.jsp\".");
                    FORWARD_TO.accept(new ForwardObject("./views/login.jsp", request, response));
                }
            }
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Lo.g("\"GET /\" received, sending to doPost...");
        this.doPost(request, response);
    }

    private static boolean validateSession(final String identifier) {
        Lo.g("Preparing to validate session with identifier \"" + identifier + "\".");
        currentSession = findSession(identifier);

        if (currentSession != null) {
            if (Math.floor(new Date().getTime() / 18000000 - currentSession.getLastActiveDate().getTime() / 18000000) < Session.ACTIVE_TIME_LIMIT) {
                if (Math.floor(new Date().getTime() / 18000000 - currentSession.getCreationDate().getTime() / 18000000) < Session.CREATION_TIME_LIMIT) {
                    Lo.g("The session was located and is not expired, so it is valid.");
                    return true;
                } else {
                    Lo.g("The session surpassed the hard-expiration duration, so it is now invalid.");
                    return false;
                }
            } else {
                Lo.g("The session surpassed the soft-expiration duration, so it is now invalid.");
                return false;
            }
        } else {
            Lo.g("The session could not be located so this session is invalid.");
            return false;
        }
    }

    private static Session findSession(final String identifier) {
        Lo.g("Searching for session with identifier \"" + identifier + "\"...", false);
        for (Session session : SESSIONS) {
            if (session.getIdentifier().equals(identifier)) {
                Lo.g(" found.");
                return session;
            }
        }

        Lo.g(" not found.");
        return null;
    }

    private static void createNewSession() {
        Lo.g("Creating new session...", false);
        final Session newSession = new Session();
        SESSIONS.add(newSession);
        currentSession = newSession;
        Lo.g(" done.");
    }
}
