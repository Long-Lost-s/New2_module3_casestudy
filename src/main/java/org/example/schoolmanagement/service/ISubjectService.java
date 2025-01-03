package org.example.schoolmanagement.service;

import org.example.schoolmanagement.model.Subject;

import java.util.List;

public interface ISubjectService {
    /**
     * Add a new subject.
     *
     * @param subject The Subject object to add.
     * @return true if the subject was added successfully, false otherwise.
     * @throws IllegalArgumentException if the subject name is null or empty.
     */
    boolean addSubject(Subject subject);

    /**
     * Retrieve all subjects.
     *
     * @return A list of all Subject objects.
     */
    List<Subject> getAllSubjects();

    /**
     * Retrieve a specific subject by its ID.
     *
     * @param id The unique ID of the subject.
     * @return The Subject object if found, otherwise null.
     */
    Subject getSubjectById(int id);

    /**
     * Update an existing subject.
     *
     * @param subject The Subject object with updated values.
     * @return true if the subject was updated successfully, false otherwise.
     * @throws IllegalArgumentException if the subject name is null or empty.
     */
    boolean updateSubject(Subject subject);

    /**
     * Delete a subject by its ID.
     *
     * @param id The unique ID of the subject to delete.
     * @return true if the subject was deleted successfully, false otherwise.
     */
    boolean deleteSubject(int id);
}
