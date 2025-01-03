package org.example.schoolmanagement.dao;

import org.example.schoolmanagement.model.Teacher;

import java.util.List;

public interface ITeacherDAO {
    /**
     * Retrieve all teachers from the database.
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
     * Add a new teacher to the database.
     *
     * @param teacher The Teacher object to add.
     * @return true if the teacher was added successfully, false otherwise.
     */
    boolean addTeacher(Teacher teacher);

    /**
     * Update an existing teacher in the database.
     *
     * @param teacher The Teacher object with updated details.
     * @return true if the teacher was updated successfully, false otherwise.
     */
    boolean updateTeacher(Teacher teacher);

    /**
     * Delete a teacher from the database by their ID.
     *
     * @param teacherId The unique ID of the teacher to delete.
     * @return true if the teacher was deleted successfully, false otherwise.
     */
    boolean deleteTeacher(int teacherId);
}
