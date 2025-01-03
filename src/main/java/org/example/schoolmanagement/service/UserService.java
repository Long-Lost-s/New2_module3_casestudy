package org.example.schoolmanagement.service;

import org.example.schoolmanagement.dao.UserDAO;
import org.example.schoolmanagement.model.User;

public class UserService {
    private final UserDAO userDAO;

    public UserService() {
        this.userDAO = new UserDAO();
    }

    public boolean registerUser(User user) {
        if (user.getUsername() == null || user.getUsername().isEmpty()) {
            throw new IllegalArgumentException("Username cannot be empty.");
        }
        if (user.getPassword() == null || user.getPassword().isEmpty()) {
            throw new IllegalArgumentException("Password cannot be empty.");
        }
        if (user.getEmail() == null || user.getEmail().isEmpty()) {
            throw new IllegalArgumentException("Email cannot be empty.");
        }
        return userDAO.registerUser(user);
    }

    public User authenticate(String username, String password) {
        return userDAO.authenticate(username, password);
    }
}
