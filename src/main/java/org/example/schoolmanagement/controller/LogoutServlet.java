package org.example.schoolmanagement.controller;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "LogoutServlet", urlPatterns = {"/logout"})

public class LogoutServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
        // Invalidate the session to log the user out
        request.getSession().invalidate();

        // Redirect to the login servlet or clean URL
        response.sendRedirect("/login");
    }
}
