package org.example.schoolmanagement.service;

import org.example.schoolmanagement.dao.TeacherDAO;
import org.example.schoolmanagement.model.Teacher;

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
}
