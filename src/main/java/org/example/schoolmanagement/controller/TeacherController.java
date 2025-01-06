package org.example.schoolmanagement.controller;

import org.example.schoolmanagement.dao.TeacherDAO;
import org.example.schoolmanagement.model.Class;
import org.example.schoolmanagement.model.ClassAverageScore;
import org.example.schoolmanagement.model.StudentAverageScore;
import org.example.schoolmanagement.model.Teacher;
import org.example.schoolmanagement.service.TeacherService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;
import java.util.logging.Logger;

@WebServlet(name = "TeacherController", urlPatterns = {"/admin/teachers"})
public class TeacherController extends HttpServlet {
    private final TeacherService teacherService;
    private TeacherDAO teacherDAO;
    private static final Logger logger = Logger.getLogger(TeacherController.class.getName());

    public TeacherController() {
        this.teacherService = new TeacherService();
        this.teacherDAO = new TeacherDAO();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");

        if ("view".equals(action)) {
            handleViewRequest(request, response);
        } else if ("edit".equals(action)) {
            handleEditRequest(request, response);
        } else if ("delete".equals(action)) {
            handleDeleteRequest(request, response);
        } else if ("add".equals(action)) {
            request.getRequestDispatcher("/views/admin/addTeacher.jsp").forward(request, response);
        } else if ("averageScores".equals(action)) {
            handleAverageScoresRequest(request, response);
        } else if ("search".equals(action)) {
            searchTeacherByName(request, response);
        } else if ("viewStudentScores".equals(action)) {
                handleViewStudentScoresRequest(request, response);
        } else {
            handleListRequest(request, response);
        }
    }

    private void searchTeacherByName(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String name = request.getParameter("name");
        try {
            List<Teacher> teachers = teacherDAO.searchTeachersByName(name);
            request.setAttribute("teachers", teachers);
            logger.info("Teachers fetched and set as request attribute");
        } catch (SQLException e) {
            logger.severe("Error fetching teachers: " + e.getMessage());
        }
        request.getRequestDispatcher("/views/admin/teachers.jsp").forward(request, response);
    }

    private void handleViewStudentScoresRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Class> classes = teacherService.getAllClasses();
        request.setAttribute("classes", classes);

        String classIdParam = request.getParameter("classId");
        if (classIdParam != null && !classIdParam.isEmpty()) {
            int classId = Integer.parseInt(classIdParam);
            List<StudentAverageScore> averageScores = teacherService.getStudentAverageScores(classId);
            request.setAttribute("averageScores", averageScores);
        }

        request.getRequestDispatcher("/views/admin/studentAverageScores.jsp").forward(request, response);
    }

    private void handleAverageScoresRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<ClassAverageScore> averageScores = teacherService.getClassAverageScores();
        request.setAttribute("averageScores", averageScores);
        request.getRequestDispatcher("/views/admin/classAverageScores.jsp").forward(request, response);
    }

    private void handleViewRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int teacherId = Integer.parseInt(request.getParameter("id"));
        Teacher teacher = teacherService.getTeacherById(teacherId);
        request.setAttribute("teacher", teacher);
        request.getRequestDispatcher("/views/admin/viewTeacher.jsp").forward(request, response);
    }

    private void handleListRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Teacher> teachers = teacherService.getAllTeachers();
        request.setAttribute("teachers", teachers);
        request.getRequestDispatcher("/views/admin/teachers.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        String action = request.getParameter("action");

        if ("add".equals(action)) {
            handleAddRequest(request, response);
        } else if ("edit".equals(action)) {
            handleUpdateRequest(request, response);
        }
    }


    private void handleAddRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String fullName = request.getParameter("fullName");
        String email = request.getParameter("email");
        String phoneNumber = request.getParameter("phoneNumber");

        Teacher teacher = new Teacher();
        teacher.setFullName(fullName);
        teacher.setEmail(email);
        teacher.setPhoneNumber(phoneNumber);

        teacherService.addTeacher(teacher);
        response.sendRedirect("/admin/teachers");
    }

    private void handleEditRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int teacherId = Integer.parseInt(request.getParameter("id"));
        Teacher teacher = teacherService.getTeacherById(teacherId);
        request.setAttribute("teacher", teacher);
        request.getRequestDispatcher("/views/admin/editTeacher.jsp").forward(request, response);
    }

    private void handleUpdateRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int teacherId = Integer.parseInt(request.getParameter("teacherId"));
        String fullName = request.getParameter("fullName");
        String email = request.getParameter("email");
        String phoneNumber = request.getParameter("phoneNumber");

        Teacher teacher = new Teacher();
        teacher.setTeacherId(teacherId);
        teacher.setFullName(fullName);
        teacher.setEmail(email);
        teacher.setPhoneNumber(phoneNumber);

        teacherService.updateTeacher(teacher);
        response.sendRedirect("/admin/teachers");
    }

    private void handleDeleteRequest(HttpServletRequest request, HttpServletResponse response) throws IOException {
        int teacherId = Integer.parseInt(request.getParameter("id"));
        teacherService.deleteTeacher(teacherId);
        response.sendRedirect("/admin/teachers");
    }
}