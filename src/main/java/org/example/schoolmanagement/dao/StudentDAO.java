package org.example.schoolmanagement.dao;

import org.example.schoolmanagement.model.Student;
import org.example.schoolmanagement.utils.DatabaseConnection;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class StudentDAO {
    public List<Student> getStudentsByClassId(int classId) {
        List<Student> students = new ArrayList<>();
        String query = "SELECT * FROM students WHERE ClassId = ?";
        try (Connection connection = DatabaseConnection.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(query)) {
            preparedStatement.setInt(1, classId);
            try (ResultSet resultSet = preparedStatement.executeQuery()) {
                while (resultSet.next()) {
                    Student student = new Student();
                    student.setStudentId(resultSet.getInt("StudentId"));
                    student.setFullName(resultSet.getString("FullName"));
                    student.setEmail(resultSet.getString("Email"));
                    student.setPhoneNumber(resultSet.getString("PhoneNumber"));
                    student.setStatus(resultSet.getString("Status"));
                    students.add(student);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return students;
    }
}
