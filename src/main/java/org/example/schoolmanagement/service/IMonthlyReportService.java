package org.example.schoolmanagement.service;

import org.example.schoolmanagement.model.MonthlyTeacherReport;

import java.util.List;

public interface IMonthlyReportService {
    /**
     * Retrieve all monthly reports.
     *
     * @return A list of all MonthlyTeacherReport objects.
     */
    List<MonthlyTeacherReport> getAllReports();

    /**
     * Add a new monthly report.
     *
     * @param report The MonthlyTeacherReport object to add.
     * @return true if the report was added successfully, false otherwise.
     */
    boolean addReport(MonthlyTeacherReport report);

    /**
     * Retrieve monthly reports by teacher ID.
     *
     * @param teacherId The unique ID of the teacher whose reports are to be retrieved.
     * @return A list of MonthlyTeacherReport objects for the given teacher.
     */
    List<MonthlyTeacherReport> getReportsByTeacherId(int teacherId);
}
