
package org.example.schoolmanagement.dao;


import org.example.schoolmanagement.model.Subject;
import org.example.schoolmanagement.utils.DatabaseConnection;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class SubjectDAO implements ISubjectDAO {
    private final String SELECT_ALL_SUBJECTS = "SELECT * FROM subjects";

    public List<Subject> selectAllSubjects() {
        List<Subject> subjects = new ArrayList<Subject>();
        try(Connection connection = DatabaseConnection.getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL_SUBJECTS);) {

            ResultSet rs = preparedStatement.executeQuery();

            while (rs.next()) {
                int subjectId = rs.getInt("SubjectId");
                String subjectName = rs.getString("SubjectName");
//                int teacherId = Integer.parseInt(rs.getString("TeacherId"));
                Subject subject = new Subject(subjectId,subjectName);
                subjects.add(subject);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return subjects;
    }

    @Override
    public boolean addSubject(Subject subject) {
        String query = "INSERT INTO subjects (SubjectName, TeacherID) VALUES (?, 1)";
        try (Connection connection = DatabaseConnection.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(query)) {

            preparedStatement.setString(1, subject.getSubjectName());
            return preparedStatement.executeUpdate() > 0;

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    @Override
    public List<Subject> getAllSubjects() {
        List<Subject> subjects = new ArrayList<>();
        String query = "SELECT * FROM subjects";
        try (Connection connection = DatabaseConnection.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(query);
             ResultSet resultSet = preparedStatement.executeQuery()) {

            while (resultSet.next()) {
                Subject subject = new Subject();
                subject.setSubjectId(resultSet.getInt("SubjectId"));
                subject.setSubjectName(resultSet.getString("SubjectName"));
                subjects.add(subject);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return subjects;
    }

    @Override
    public Subject getSubjectById(int id) {
        String query = "SELECT * FROM subjects WHERE SubjectId = ?";
        try (Connection connection = DatabaseConnection.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(query)) {

            preparedStatement.setInt(1, id);
            try (ResultSet resultSet = preparedStatement.executeQuery()) {
                if (resultSet.next()) {
                    return new Subject(
                            resultSet.getInt("SubjectId"),
                            resultSet.getString("SubjectName")
                    );
                }
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    @Override
    public boolean updateSubject(Subject subject) {
        String query = "UPDATE subjects SET SubjectName = ? WHERE SubjectID = ?";
        try (Connection connection = DatabaseConnection.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(query)) {

            preparedStatement.setString(1, subject.getSubjectName());
            preparedStatement.setInt(2, subject.getSubjectId());
            return preparedStatement.executeUpdate() > 0;

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    @Override
    public boolean deleteSubject(int id) {
        String query = "DELETE FROM subjects WHERE SubjectID = ?";
        try (Connection connection = DatabaseConnection.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(query)) {

            preparedStatement.setInt(1, id);
            return preparedStatement.executeUpdate() > 0;

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }
}
