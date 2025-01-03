package org.example.schoolmanagement.controller;

import org.example.schoolmanagement.model.User;
import org.example.schoolmanagement.service.UserService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "AuthController", urlPatterns = {"/login", "/register"})

public class AuthController extends HttpServlet {
    private final UserService userService;

    public AuthController() {
        this.userService = new UserService();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getServletPath();

        if ("/register".equals(action)) {
            request.getRequestDispatcher("/views/register.jsp").forward(request, response);
        } else if ("/login".equals(action)) {
            request.getRequestDispatcher("/views/login.jsp").forward(request, response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getServletPath();

        if ("/register".equals(action)) {
            handleRegister(request, response);
        } else if ("/login".equals(action)) {
            handleLogin(request, response);
        }
    }

    private void handleRegister(HttpServletRequest request, HttpServletResponse response) throws IOException {
        User user = new User();
        user.setUsername(request.getParameter("username"));
        user.setPassword(request.getParameter("password")); // Ensure password is hashed
        user.setEmail(request.getParameter("email"));
        user.setRole(request.getParameter("role"));

        if (userService.registerUser(user)) {
            response.sendRedirect("/views/login.jsp?success=Registration successful. Please log in.");
        } else {
            response.sendRedirect("/views/register.jsp?error=Registration failed.");
        }
    }

    private void handleLogin(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");

        User user = userService.authenticate(username, password);
        if (user != null) {
            request.getSession().setAttribute("user", user);
            switch (user.getRole()) {
                case "admin":
                    response.sendRedirect("/views/admin/admin_dashboard.jsp");
                    break;
                case "academic_staff":
                    response.sendRedirect("/views/academic_staff/dashboard.jsp");
                    break;
                case "teacher":
                    response.sendRedirect("/views/teacher/dashboard.jsp");
                    break;
                case "student":
                    response.sendRedirect("/views/student/dashboard.jsp");
                    break;
                default:
                    response.sendRedirect("/views/login.jsp?error=Invalid role.");
            }
        } else {
            response.sendRedirect("/views/login.jsp?error=Invalid credentials.");
        }
    }
}
