package org.example.schoolmanagement.dao;

<<<<<<< HEAD

import org.example.schoolmanagement.model.Classes;
=======
import org.example.schoolmanagement.model.Classes;
import org.example.schoolmanagement.model.Student;
>>>>>>> 579e11e9e99cf35bd66e7da29a44e687175e2e83
import org.example.schoolmanagement.utils.DatabaseConnection;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

<<<<<<< HEAD
public class ClassesDAO implements IClassesDAO {
    private String SELECT_ALL_CLASSES = "SELECT * FROM classes";

    @Override
    public List<Classes> selectAllClasses() {
        List<Classes> classes = new ArrayList<Classes>();
        try(Connection connection = DatabaseConnection.getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL_CLASSES);) {

            ResultSet rs = preparedStatement.executeQuery();

            while (rs.next()) {
                int classId = rs.getInt("ClassId");
                String className = rs.getString("ClassName");
                int teacherId = Integer.parseInt(rs.getString("TeacherId"));
                Classes classs = new Classes(classId,className,teacherId);
                classes.add(classs);
=======
public class ClassesDAO {
    public List<Classes> getAllClasses() {
        List<Classes> classes = new ArrayList<>();
        String query = "SELECT * FROM classes";
        try (Connection connection = DatabaseConnection.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(query);
             ResultSet resultSet = preparedStatement.executeQuery()) {

            while (resultSet.next()) {
                Classes cls = new Classes();
                cls.setClassId(resultSet.getInt("ClassId"));
                cls.setClassName(resultSet.getString("ClassName"));
                cls.setTeacherID(resultSet.getInt("TeacherId"));
                classes.add(cls);
>>>>>>> 579e11e9e99cf35bd66e7da29a44e687175e2e83
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return classes;
    }

<<<<<<< HEAD
    @Override
    public void insertClasses(Classes classes) {

    }

    @Override
    public void updateClasses(Classes classes) {

    }

    @Override
    public void deleteClasses(Classes classes) {

    }

    @Override
    public Classes selectClasses(int id) {
        return null;
    }
}
=======
    public boolean addClass(Classes cls) {
        String query = "INSERT INTO classes (ClassName, TeacherId) VALUES (?, ?)";
        try (Connection connection = DatabaseConnection.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(query)) {
            preparedStatement.setString(1, cls.getClassName());
            preparedStatement.setInt(2, cls.getTeacherID());
            return preparedStatement.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    public Classes getClassById(int classId) {
        String query = "SELECT * FROM classes WHERE ClassId = ?";
        try (Connection connection = DatabaseConnection.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(query)) {
            preparedStatement.setInt(1, classId);
            try (ResultSet resultSet = preparedStatement.executeQuery()) {
                if (resultSet.next()) {
                    Classes cls = new Classes();
                    cls.setClassId(resultSet.getInt("ClassId"));
                    cls.setClassName(resultSet.getString("ClassName"));
                    cls.setTeacherID(resultSet.getInt("TeacherId"));
                    return cls;
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    public boolean updateClass(Classes cls) {
        String query = "UPDATE classes SET ClassName = ?, TeacherId = ? WHERE ClassId = ?";
        try (Connection connection = DatabaseConnection.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(query)) {
            preparedStatement.setString(1, cls.getClassName());
            preparedStatement.setInt(2, cls.getTeacherID());
            preparedStatement.setInt(3, cls.getClassId());
            return preparedStatement.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    public boolean deleteClass(int classId) {
        String query = "DELETE FROM classes WHERE ClassId = ?";
        try (Connection connection = DatabaseConnection.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(query)) {
            preparedStatement.setInt(1, classId);
            return preparedStatement.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
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
                    students.add(student);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return students;
    }

}
>>>>>>> 579e11e9e99cf35bd66e7da29a44e687175e2e83
