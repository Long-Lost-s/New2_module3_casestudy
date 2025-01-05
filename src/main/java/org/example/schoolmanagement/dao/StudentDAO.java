package org.example.schoolmanagement.dao;

import org.example.schoolmanagement.model.Student;
import org.example.schoolmanagement.model.StudentStatus;
import org.example.schoolmanagement.utils.DatabaseConnection;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

public class StudentDAO {
    private final String SELECT_ALL_STUDENTS = "SELECT * FROM students";
    private final String INSERT_STUDENT = "INSERT INTO students " +
            "(FullName,Email,PhoneNumber," +
            "Status,DateOfBirth,Address,ClassId) " +
            "VALUES(?,?,?,?,?,?,?)";
    private final String UPDATE_STUDENT_STATUS = "UPDATE students SET " +
            "Status = ? WHERE StudentId = ?;";
    private final String DELETE_STUDENT = "DELETE FROM students WHERE StudentId = ?;";
    private final String SELECT_STUDENT_BY_ID = "SELECT * FROM students WHERE StudentId = ?";
    private final String SELECT_STUDENTS_BY_CLASS_ID = "SELECT * FROM students WHERE ClassId = ?";
    private final String SELECT_STUDENTS_BY_SUBJECT_ID = "SELECT students.FullName, " +
            "students.ClassId, scores.TheoryScore, " +
            "scores.PracticeScore, scores.average_score " +
            "FROM students JOIN scores " +
            "ON students.StudentId = scores.StudentId " +
            "WHERE scores.SubjectId = 1;";

    public List<Student> selectAllStudents() {
        List<Student> students = new ArrayList<>();
        try(Connection connection = DatabaseConnection.getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL_STUDENTS);) {

            ResultSet rs = preparedStatement.executeQuery();

            while (rs.next()) {
                int studentId = rs.getInt("StudentId");
                String fullName = rs.getString("FullName");
                String email = rs.getString("Email");
                String phoneNumber = rs.getString("PhoneNumber");
                StudentStatus status = StudentStatus.fromString(rs.getString("Status"));
                LocalDate dateOfBirth = rs.getDate("DateOfBirth").toLocalDate();
                String address = rs.getString("Address");
                int classId = rs.getInt("ClassId");
                Student student = new Student(studentId,fullName,email,phoneNumber,status,dateOfBirth,address,classId);
                students.add(student);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return students;
    }

    public void insertStudent(Student student) {

    }

    public void updateStudent(Student student) {

    }

    public void deleteStudent(Student student) {

    }

    public Student selectStudent(int id) {
        Student student = null;

        try (Connection connection = DatabaseConnection.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(SELECT_STUDENT_BY_ID);) {
            preparedStatement.setInt(1, id);
            ResultSet rs = preparedStatement.executeQuery();

            while (rs.next()) {
                int studentId = rs.getInt("StudentId");
                String fullName = rs.getString("FullName");
                String email = rs.getString("Email");
                String phoneNumber = rs.getString("PhoneNumber");
                StudentStatus status = StudentStatus.fromString(rs.getString("Status"));
                LocalDate dateOfBirth = rs.getDate("DateOfBirth").toLocalDate();
                String address = rs.getString("Address");
                int classId = rs.getInt("ClassId");
                student = new Student(studentId,fullName,email,phoneNumber,status,dateOfBirth,address,classId);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return student;
    }

    public List<Student> selectStudentsByClass(int id) {
        List<Student> students = new ArrayList<>();
        try (Connection connection = DatabaseConnection.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(SELECT_STUDENTS_BY_CLASS_ID);) {
            preparedStatement.setInt(1, id);
            ResultSet rs = preparedStatement.executeQuery();

            while (rs.next()) {
                int studentId = rs.getInt("StudentId");
                String fullName = rs.getString("FullName");
                String email = rs.getString("Email");
                String phoneNumber = rs.getString("PhoneNumber");
                StudentStatus status = StudentStatus.fromString(rs.getString("Status"));
                LocalDate dateOfBirth = rs.getDate("DateOfBirth").toLocalDate();
                String address = rs.getString("Address");
                int classId = rs.getInt("ClassId");
                Student student = new Student(studentId,fullName,email,phoneNumber,status,dateOfBirth,address,classId);
                students.add(student);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return students;
    }

    public void updateStudentStatus(int studentId, StudentStatus status) {
        try (Connection connection = DatabaseConnection.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(UPDATE_STUDENT_STATUS);) {
            preparedStatement.setString(1, status.toString());
            preparedStatement.setInt(2, studentId);
            System.out.println(preparedStatement.toString());
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
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
                    student.setStatus(StudentStatus.fromString(resultSet.getString("Status")));
                    students.add(student);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return students;
    }
}