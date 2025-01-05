package org.example.schoolmanagement.controller;

import org.example.schoolmanagement.dao.ClassesDAO;
import org.example.schoolmanagement.dao.StudentDAO;
import org.example.schoolmanagement.model.Classes;
import org.example.schoolmanagement.model.Student;
import org.example.schoolmanagement.model.StudentStatus;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

@WebServlet(name = "TeacherDashboardController", urlPatterns = {"/teacher/dashboard"})

public class TeacherDashboardController extends HttpServlet {
//    @Override
//    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//        request.getRequestDispatcher("/views/teacher/dashboard.jsp").forward(request, response);
//    }
//    @Override
//    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//        // Handle POST request (if needed)
//        doGet(request, response);
//    }

    private static final long serialVersionUID = 1L;
    private StudentDAO studentDAO;
    private ClassesDAO classDAO;

    @Override
    public void init() {
        studentDAO = new StudentDAO();
        classDAO = new ClassesDAO();
    }

    @Override
    public void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        String action = request.getParameter("action");
        if (action == null) action = "";

        try {
            switch (action) {
                case "edit":
                    showEditStatusForm(request, response);
                    break;
                default:
                    listStudents(request, response);
                    break;
            }
        } catch (SQLException e) {
            throw new ServletException(e);
        }
    }

    private void showEditStatusForm (HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException, ServletException {
        int studentId = Integer.parseInt(request.getParameter("studentId"));

        Student student = studentDAO.selectStudent(studentId);
        request.setAttribute("student", student);

        request.getRequestDispatcher("/views/teacher/editStudentStatus.jsp").forward(request, response);
    }

    private void listStudents (HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException, ServletException {
        String classId = request.getParameter("classId");
        if (classId == null) classId = "";

        List<Student> studentList;
        if (classId.isEmpty()) {
            studentList = studentDAO.selectAllStudents();
        } else {
            studentList = studentDAO.selectStudentsByClass(Integer.parseInt(classId));
        }

        List<Classes> classesList = classDAO.getAllClasses();

        request.setAttribute("studentList", studentList);
        request.setAttribute("classesList", classesList);
        request.setAttribute("classId", classId);

        RequestDispatcher dispatcher = request.getRequestDispatcher("/views/teacher/listStudent.jsp");
        dispatcher.forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        String action = request.getParameter("action");
        if (action == null) action = "";

        try {
            switch (action) {
                case "edit":
                    editStudentStatus(request, response);
                    break;
                default:
                    listStudents(request, response);
                    break;
            }
        } catch (SQLException e) {
            throw new ServletException(e);
        }
    }

    private void editStudentStatus(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException, ServletException {
        int studentId = Integer.parseInt(request.getParameter("studentId"));
        System.out.println(request.getParameter("status"));
        StudentStatus status = StudentStatus.fromString(request.getParameter("status"));

        studentDAO.updateStudentStatus(studentId, status);
        request.getRequestDispatcher("/views/teacher/listStudent.jsp");
        listStudents(request, response);
    }
}
