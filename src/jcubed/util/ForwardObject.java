package jcubed.util;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class ForwardObject {
    private final String url;
    private final HttpServletRequest request;
    private final HttpServletResponse response;

    public ForwardObject(final String url, final HttpServletRequest request, final HttpServletResponse response) {
        this.url = url;
        this.request = request;
        this.response = response;
    }

    public String getUrl() {
        return this.url;
    }

    public HttpServletRequest getRequest() {
        return this.request;
    }

    public HttpServletResponse getResponse() {
        return this.response;
    }

    public void forwardTo() {
        final RequestDispatcher requestDispatcher = this.request.getRequestDispatcher(this.url);

        try {
            requestDispatcher.forward(this.request, this.response);
        } catch (final ServletException | IOException e) {
            e.printStackTrace();
        }
    }
}