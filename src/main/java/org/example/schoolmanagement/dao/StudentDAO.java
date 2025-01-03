package org.example.schoolmanagement.dao;

import org.example.schoolmanagement.model.Student;
import org.example.schoolmanagement.utils.DatabaseConnection;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class StudentDAO {

    public List<Student> getStudentsByClassId(int classId) {
        List<Student> students = new ArrayList<>();
        String query = "SELECT * FROM students WHERE ClassId = ?";
        try (Connection connection = DatabaseConnection.getConnection();
             PreparedStatement statement = connection.prepareStatement(query)) {
            statement.setInt(1, classId);

            try (ResultSet resultSet = statement.executeQuery()) {
                while (resultSet.next()) {
                    Student student = new Student();
                    student.setStudentId(resultSet.getInt("StudentId"));
                    student.setFullName(resultSet.getString("FullName"));
                    student.setEmail(resultSet.getString("Email"));
                    student.setPhoneNumber(resultSet.getString("PhoneNumber"));
                    student.setDateOfBirth(resultSet.getString("DateOfBirth"));
                    student.setAddress(resultSet.getString("Address"));
                    student.setStatus(resultSet.getString("Status"));
                    students.add(student);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return students;
    }

    public List<Student> getStudentsByClassIdAndStatus(int classId, String status) {
        List<Student> students = new ArrayList<>();
        String query = "SELECT * FROM students WHERE ClassId = ? AND Status = ?";
        try (Connection connection = DatabaseConnection.getConnection();
             PreparedStatement statement = connection.prepareStatement(query)) {
            statement.setInt(1, classId);
            statement.setString(2, status);

            try (ResultSet resultSet = statement.executeQuery()) {
                while (resultSet.next()) {
                    Student student = new Student();
                    student.setStudentId(resultSet.getInt("StudentId"));
                    student.setFullName(resultSet.getString("FullName"));
                    student.setEmail(resultSet.getString("Email"));
                    student.setPhoneNumber(resultSet.getString("PhoneNumber"));
                    student.setDateOfBirth(resultSet.getString("DateOfBirth"));
                    student.setAddress(resultSet.getString("Address"));
                    student.setStatus(resultSet.getString("Status"));
                    students.add(student);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return students;
    }

    public Student getStudentById(int studentId) {
        String query = "SELECT * FROM students WHERE StudentId = ?";
        try (Connection connection = DatabaseConnection.getConnection();
             PreparedStatement statement = connection.prepareStatement(query)) {
            statement.setInt(1, studentId);

            try (ResultSet resultSet = statement.executeQuery()) {
                if (resultSet.next()) {
                    Student student = new Student();
                    student.setStudentId(resultSet.getInt("StudentId"));
                    student.setFullName(resultSet.getString("FullName"));
                    student.setEmail(resultSet.getString("Email"));
                    student.setPhoneNumber(resultSet.getString("PhoneNumber"));
                    student.setStatus(resultSet.getString("Status"));
                    student.setDateOfBirth(String.valueOf(resultSet.getDate("DateOfBirth").toLocalDate()));
                    student.setAddress(resultSet.getString("Address"));
                    return student;
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }
}