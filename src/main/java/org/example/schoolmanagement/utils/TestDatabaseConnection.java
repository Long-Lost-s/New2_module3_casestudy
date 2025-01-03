package org.example.schoolmanagement.utils;

import java.sql.Connection;

public class TestDatabaseConnection {
    public static void main(String[] args) {
        try (Connection connection = DatabaseConnection.getConnection()) {
            if (connection != null) {
                System.out.println("Database connection successful!");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}