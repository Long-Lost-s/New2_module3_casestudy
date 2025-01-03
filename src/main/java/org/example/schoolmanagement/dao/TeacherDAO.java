package org.example.schoolmanagement.dao;

import org.example.schoolmanagement.model.Teacher;
import org.example.schoolmanagement.utils.DatabaseConnection;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class TeacherDAO implements ITeacherDAO {

    @Override
    public List<Teacher> getAllTeachers() {
        List<Teacher> teachers = new ArrayList<>();
        String query = "SELECT t.*, (SELECT COUNT(*) FROM students s WHERE s.ClassId IN (SELECT ClassId FROM classes c WHERE c.TeacherId = t.TeacherId)) AS totalStudents FROM teachers t";
        try (Connection connection = DatabaseConnection.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(query);
             ResultSet resultSet = preparedStatement.executeQuery()) {

            while (resultSet.next()) {
                Teacher teacher = new Teacher();
                teacher.setTeacherId(resultSet.getInt("TeacherId"));
                teacher.setFullName(resultSet.getString("FullName"));
                teacher.setEmail(resultSet.getString("Email"));
                teacher.setPhoneNumber(resultSet.getString("PhoneNumber"));
                teacher.setTotalStudents(resultSet.getInt("totalStudents")); // Set total students
                teachers.add(teacher);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return teachers;
    }

    @Override
    public Teacher getTeacherById(int teacherId) {
        String query = "SELECT t.*, (SELECT COUNT(*) FROM students s WHERE s.ClassId IN (SELECT ClassId FROM classes c WHERE c.TeacherId = t.TeacherId)) AS totalStudents FROM teachers t WHERE t.TeacherId = ?";
        try (Connection connection = DatabaseConnection.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(query)) {

            preparedStatement.setInt(1, teacherId);
            try (ResultSet resultSet = preparedStatement.executeQuery()) {
                if (resultSet.next()) {
                    Teacher teacher = new Teacher();
                    teacher.setTeacherId(resultSet.getInt("TeacherId"));
                    teacher.setFullName(resultSet.getString("FullName"));
                    teacher.setEmail(resultSet.getString("Email"));
                    teacher.setPhoneNumber(resultSet.getString("PhoneNumber"));
                    teacher.setTotalStudents(resultSet.getInt("totalStudents")); // Set total students
                    return teacher;
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    @Override
    public boolean addTeacher(Teacher teacher) {
        String query = "INSERT INTO teachers (FullName, Email, PhoneNumber) VALUES (?, ?, ?)";
        try (Connection connection = DatabaseConnection.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(query)) {

            preparedStatement.setString(1, teacher.getFullName());
            preparedStatement.setString(2, teacher.getEmail());
            preparedStatement.setString(3, teacher.getPhoneNumber());

            return preparedStatement.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    @Override
    public boolean updateTeacher(Teacher teacher) {
        String query = "UPDATE teachers SET FullName = ?, Email = ?, PhoneNumber = ? WHERE TeacherId = ?";
        try (Connection connection = DatabaseConnection.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(query)) {

            preparedStatement.setString(1, teacher.getFullName());
            preparedStatement.setString(2, teacher.getEmail());
            preparedStatement.setString(3, teacher.getPhoneNumber());
            preparedStatement.setInt(4, teacher.getTeacherId());

            return preparedStatement.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    @Override
    public boolean deleteTeacher(int teacherId) {
        String query = "DELETE FROM teachers WHERE TeacherId = ?";
        try (Connection connection = DatabaseConnection.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(query)) {

            preparedStatement.setInt(1, teacherId);
            return preparedStatement.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }
}