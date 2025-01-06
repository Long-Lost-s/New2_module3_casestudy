package org.example.schoolmanagement.dao;

import org.example.schoolmanagement.model.Teacher;

import java.util.List;

public interface ITeacherDAO {
    List<Teacher> getAllTeachers();
    Teacher getTeacherById(int teacherId);
    boolean addTeacher(Teacher teacher);
    boolean updateTeacher(Teacher teacher);
    boolean deleteTeacher(int teacherId);
}