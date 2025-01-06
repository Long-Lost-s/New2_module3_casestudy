package org.example.schoolmanagement.controller;

import org.example.schoolmanagement.dao.StudentDAO;
import org.example.schoolmanagement.model.Student;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;
import java.util.logging.Logger;

@WebServlet("/viewAllStudentScores")
public class ViewAllStudentScoresController extends HttpServlet {
    private static final Logger logger = Logger.getLogger(ViewAllStudentScoresController.class.getName());
    private StudentDAO studentDAO;

    public void init() {
        studentDAO = new StudentDAO();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            List<Student> students = studentDAO.getAllStudentsWithScores();
            request.setAttribute("students", students);
            logger.info("Students and scores fetched and set as request attribute");
        } catch (SQLException e) {
            logger.severe("Error fetching students and scores: " + e.getMessage());
        }

        request.getRequestDispatcher("/views/student/viewAllStudentScores.jsp").forward(request, response);
    }
}