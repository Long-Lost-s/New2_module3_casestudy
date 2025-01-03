package org.example.schoolmanagement.service;

import org.example.schoolmanagement.model.Teacher;

import java.util.List;

public interface ITeacherService {
    /**
     * Retrieve all teachers.
     *
     * @return A list of all Teacher objects.
     */
    List<Teacher> getAllTeachers();

    /**
     * Retrieve a specific teacher by their ID.
     *
     * @param teacherId The unique ID of the teacher.
     * @return The Teacher object if found, otherwise null.
     */
    Teacher getTeacherById(int teacherId);

    /**
     * Add a new teacher.
     *
     * @param teacher The Teacher object to add.
     * @return true if the teacher was added successfully, false otherwise.
     */
    boolean addTeacher(Teacher teacher);

    /**
     * Update an existing teacher.
     *
     * @param teacher The Teacher object with updated values.
     * @return true if the teacher was updated successfully, false otherwise.
     */
    boolean updateTeacher(Teacher teacher);

    /**
     * Delete a teacher by their ID.
     *
     * @param teacherId The unique ID of the teacher to delete.
     * @return true if the teacher was deleted successfully, false otherwise.
     */
    boolean deleteTeacher(int teacherId);
}
