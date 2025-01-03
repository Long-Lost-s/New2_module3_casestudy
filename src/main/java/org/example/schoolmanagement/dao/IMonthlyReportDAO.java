package org.example.schoolmanagement.dao;

import org.example.schoolmanagement.model.MonthlyTeacherReport;

import java.util.List;

public interface IMonthlyReportDAO {
    /**
     * Fetch all monthly reports from the database.
     *
     * @return A list of all MonthlyTeacherReport objects, sorted by the most recent report date.
     */
    List<MonthlyTeacherReport> getAllReports();

    /**
     * Add a new monthly report to the database.
     *
     * @param report A MonthlyTeacherReport object containing the details of the report to add.
     * @return true if the report was added successfully, false otherwise.
     */
    boolean addReport(MonthlyTeacherReport report);

    /**
     * Fetch all reports for a specific teacher, identified by their teacher ID.
     *
     * @param teacherId The unique ID of the teacher whose reports you want to retrieve.
     * @return A list of MonthlyTeacherReport objects for the given teacher, sorted by the most recent report date.
     */
    List<MonthlyTeacherReport> getReportsByTeacherId(int teacherId);
}
