
package org.example.schoolmanagement.dao;


import org.example.schoolmanagement.model.SchoolClass;
import org.example.schoolmanagement.utils.DatabaseConnection;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class SchoolClassDAO {
    public List<SchoolClass> getAllClasses() {
        List<SchoolClass> classes = new ArrayList<>();
        String query = "SELECT * FROM classes";
        try (Connection connection = DatabaseConnection.getConnection();
             PreparedStatement statement = connection.prepareStatement(query);
             ResultSet resultSet = statement.executeQuery()) {

            while (resultSet.next()) {
                SchoolClass schoolClass = new SchoolClass();
                schoolClass.setClassId(resultSet.getInt("ClassId"));
                schoolClass.setClassName(resultSet.getString("ClassName"));
                schoolClass.setTeacherId(resultSet.getInt("TeacherId"));
                classes.add(schoolClass);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return classes;
    }
}
