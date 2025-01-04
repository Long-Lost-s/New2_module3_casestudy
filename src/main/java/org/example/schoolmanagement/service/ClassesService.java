package org.example.schoolmanagement.service;

import org.example.schoolmanagement.dao.ClassesDAO;
import org.example.schoolmanagement.dao.StudentDAO;
import org.example.schoolmanagement.model.Classes;
import org.example.schoolmanagement.model.Student;

import java.util.List;

public class ClassesService {
    private final ClassesDAO classesDAO;
    private final StudentDAO studentDAO;

    public ClassesService() {
        this.classesDAO = new ClassesDAO();
        this.studentDAO = new StudentDAO();
    }

    public List<Classes> getAllClasses() {
        return classesDAO.getAllClasses();
    }

    public boolean addClass(Classes cls) {
        return classesDAO.addClass(cls);
    }

    public Classes getClassById(int classId) {
        return classesDAO.getClassById(classId);
    }

    public boolean updateClass(Classes cls) {
        return classesDAO.updateClass(cls);
    }

    public boolean deleteClass(int classId) {
        return classesDAO.deleteClass(classId);
    }

    public List<Student> getStudentsByClassId(int classId) {
        return studentDAO.getStudentsByClassId(classId);
    }
}