package org.example.schoolmanagement.service;

import org.example.schoolmanagement.model.Teacher;

import java.util.List;

public interface ITeacherService {
    List<Teacher> getAllTeachers();
    Teacher getTeacherById(int teacherId);
    boolean addTeacher(Teacher teacher);
    boolean updateTeacher(Teacher teacher);
    boolean deleteTeacher(int teacherId);
}