package org.example.schoolmanagement.service;

import org.example.schoolmanagement.dao.SubjectDAO;
import org.example.schoolmanagement.model.Subject;

import java.util.List;

public class SubjectService implements ISubjectService {
    private final SubjectDAO subjectDAO;

    public SubjectService() {
        this.subjectDAO = new SubjectDAO();
    }

    @Override
    public boolean addSubject(Subject subject) {
        if (subject.getSubjectName() == null || subject.getSubjectName().isEmpty()) {
            throw new IllegalArgumentException("Subject name cannot be empty.");
        }
        return subjectDAO.addSubject(subject);
    }

    @Override
    public List<Subject> getAllSubjects() {
        return subjectDAO.getAllSubjects();
    }

    @Override
    public Subject getSubjectById(int id) {
        return subjectDAO.getSubjectById(id);
    }

    @Override
    public boolean updateSubject(Subject subject) {
        if (subject.getSubjectName() == null || subject.getSubjectName().isEmpty()) {
            throw new IllegalArgumentException("Subject name cannot be empty.");
        }
        return subjectDAO.updateSubject(subject);
    }

    @Override
    public boolean deleteSubject(int id) {
        return subjectDAO.deleteSubject(id);
    }
}
