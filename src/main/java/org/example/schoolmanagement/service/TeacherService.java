package org.example.schoolmanagement.service;

import org.example.schoolmanagement.dao.TeacherDAO;
import org.example.schoolmanagement.model.ClassAverageScore;
import org.example.schoolmanagement.model.StudentAverageScore;
import org.example.schoolmanagement.model.Teacher;
import org.example.schoolmanagement.utils.DatabaseConnection;
import org.example.schoolmanagement.model.Class;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class TeacherService implements ITeacherService {
    private final TeacherDAO teacherDAO;

    public TeacherService() {
        this.teacherDAO = new TeacherDAO();
    }

    @Override
    public List<Teacher> getAllTeachers() {
        return teacherDAO.getAllTeachers();
    }

    @Override
    public Teacher getTeacherById(int teacherId) {
        return teacherDAO.getTeacherById(teacherId);
    }

    @Override
    public boolean addTeacher(Teacher teacher) {
        return teacherDAO.addTeacher(teacher);
    }

    @Override
    public boolean updateTeacher(Teacher teacher) {
        return teacherDAO.updateTeacher(teacher);
    }

    @Override
    public boolean deleteTeacher(int teacherId) {
        return teacherDAO.deleteTeacher(teacherId);
    }

    public List<ClassAverageScore> getClassAverageScores() {
        List<ClassAverageScore> averageScores = new ArrayList<>();
        String query = "SELECT c.ClassId, c.ClassName, AVG(s.average_score) as average_score " +
                "FROM classes c " +
                "JOIN students st ON c.ClassId = st.ClassId " +
                "JOIN scores s ON st.StudentId = s.StudentId " +
                "GROUP BY c.ClassId, c.ClassName";

        try (Connection connection = DatabaseConnection.getConnection();
             PreparedStatement statement = connection.prepareStatement(query);
             ResultSet resultSet = statement.executeQuery()) {

            while (resultSet.next()) {
                ClassAverageScore classAverageScore = new ClassAverageScore();
                classAverageScore.setClassId(resultSet.getInt("ClassId"));
                classAverageScore.setClassName(resultSet.getString("ClassName"));
                classAverageScore.setAverageScore(resultSet.getDouble("average_score"));
                averageScores.add(classAverageScore);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return averageScores;
    }

    public List<StudentAverageScore> getStudentAverageScores(int classId) {
        List<StudentAverageScore> averageScores = new ArrayList<>();
        String query = "SELECT st.StudentId, st.FullName, AVG(s.average_score) as average_score " +
                "FROM students st " +
                "JOIN scores s ON st.StudentId = s.StudentId " +
                "WHERE st.ClassId = ? " +
                "GROUP BY st.StudentId, st.FullName";

        try (Connection connection = DatabaseConnection.getConnection();
             PreparedStatement statement = connection.prepareStatement(query)) {
            statement.setInt(1, classId);
            try (ResultSet resultSet = statement.executeQuery()) {
                while (resultSet.next()) {
                    StudentAverageScore studentAverageScore = new StudentAverageScore();
                    studentAverageScore.setStudentId(resultSet.getInt("StudentId"));
                    studentAverageScore.setFullName(resultSet.getString("FullName"));
                    studentAverageScore.setAverageScore(resultSet.getDouble("average_score"));
                    averageScores.add(studentAverageScore);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return averageScores;
    }

    public List<Class> getAllClasses() {
        List<Class> classes = new ArrayList<>();
        String query = "SELECT ClassId, ClassName FROM classes";

        try (Connection connection = DatabaseConnection.getConnection();
             PreparedStatement statement = connection.prepareStatement(query);
             ResultSet resultSet = statement.executeQuery()) {

            while (resultSet.next()) {
                Class cls = new Class();
                cls.setClassId(resultSet.getInt("ClassId"));
                cls.setClassName(resultSet.getString("ClassName"));
                classes.add(cls);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return classes;
    }
}