package org.example.schoolmanagement.dao;

import org.example.schoolmanagement.model.Score;
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
import java.util.logging.Logger;

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
    private final String SELECT_STUDENTS_BY_CLASS_ID_AND_STATUS = "SELECT * FROM students WHERE ClassId LIKE ? AND Status LIKE ?";
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

    public List<Student> selectStudentsByClass(String id, String status) {
        List<Student> students = new ArrayList<>();
        try (Connection connection = DatabaseConnection.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(SELECT_STUDENTS_BY_CLASS_ID_AND_STATUS);) {
            preparedStatement.setString(1, id);
            preparedStatement.setString(2, status);
            ResultSet rs = preparedStatement.executeQuery();

            while (rs.next()) {
                int studentId = rs.getInt("StudentId");
                String fullName = rs.getString("FullName");
                String email = rs.getString("Email");
                String phoneNumber = rs.getString("PhoneNumber");
                StudentStatus studentStatus = StudentStatus.fromString(rs.getString("Status"));
                LocalDate dateOfBirth = rs.getDate("DateOfBirth").toLocalDate();
                String address = rs.getString("Address");
                int classId = rs.getInt("ClassId");
                Student student = new Student(studentId,fullName,email,phoneNumber,studentStatus,dateOfBirth,address,classId);
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

    public List<Score> getScoresByStudentIdAndExamPeriod(int studentId, String examPeriod) throws SQLException {
        List<Score> scores = new ArrayList<>();
        String sql = "SELECT s.SubjectName, sc.TheoryScore, sc.PracticeScore, sc.average_score " +
                "FROM scores sc " +
                "JOIN subjects s ON sc.SubjectId = s.SubjectId " +
                "WHERE sc.StudentId = ? AND sc.exam_period = ?";

        try (Connection connection = DatabaseConnection.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(sql)) {
            preparedStatement.setInt(1, studentId);
            preparedStatement.setString(2, examPeriod);
            ResultSet resultSet = preparedStatement.executeQuery();

            while (resultSet.next()) {
                Score score = new Score();
                score.setSubjectName(resultSet.getString("SubjectName"));
                score.setTheoryScore(resultSet.getBigDecimal("TheoryScore"));
                score.setPracticeScore(resultSet.getBigDecimal("PracticeScore"));
                score.setAverageScore(resultSet.getBigDecimal("average_score"));
                scores.add(score);
            }
        }
        return scores;
    }

    private static final Logger logger = Logger.getLogger(StudentDAO.class.getName());


    public List<Student> getAllStudentsWithScores() throws SQLException {
        List<Student> students = new ArrayList<>();
        String sql = "SELECT st.StudentId, st.FullName, s.SubjectName, sc.TheoryScore, sc.PracticeScore, sc.average_score " +
                "FROM students st " +
                "LEFT JOIN scores sc ON st.StudentId = sc.StudentId " +
                "LEFT JOIN subjects s ON sc.SubjectId = s.SubjectId";

        try (Connection connection = DatabaseConnection.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(sql)) {
            ResultSet resultSet = preparedStatement.executeQuery();

            while (resultSet.next()) {
                int studentId = resultSet.getInt("StudentId");
                String fullName = resultSet.getString("FullName");
                String subjectName = resultSet.getString("SubjectName");
                Score score = new Score();
                score.setSubjectName(subjectName);
                score.setTheoryScore(resultSet.getBigDecimal("TheoryScore"));
                score.setPracticeScore(resultSet.getBigDecimal("PracticeScore"));
                score.setAverageScore(resultSet.getBigDecimal("average_score"));

                Student student = new Student();
                student.setStudentId(studentId);
                student.setFullName(fullName);
                student.addScore(score);

                students.add(student);
            }
        } catch (SQLException e) {
            logger.severe("Error fetching students and scores: " + e.getMessage());
            throw e;
        }
        return students;
    }
}