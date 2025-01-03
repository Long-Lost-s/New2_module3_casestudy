package org.example.schoolmanagement.service;

import org.example.schoolmanagement.dao.MonthlyReportDAO;
import org.example.schoolmanagement.model.MonthlyTeacherReport;

import java.util.List;

public class MonthlyReportService implements IMonthlyReportService {
    private final MonthlyReportDAO monthlyReportDAO;

    public MonthlyReportService() {
        this.monthlyReportDAO = new MonthlyReportDAO();
    }

    @Override
    public List<MonthlyTeacherReport> getAllReports() {
        return monthlyReportDAO.getAllReports();
    }

    @Override
    public boolean addReport(MonthlyTeacherReport report) {
        return monthlyReportDAO.addReport(report);
    }

    @Override
    public List<MonthlyTeacherReport> getReportsByTeacherId(int teacherId) {
        return monthlyReportDAO.getReportsByTeacherId(teacherId);
    }
}
