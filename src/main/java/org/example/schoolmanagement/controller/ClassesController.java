package org.example.schoolmanagement.controller;

import org.example.schoolmanagement.model.Classes;
import org.example.schoolmanagement.model.Student;
import org.example.schoolmanagement.service.ClassesService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "ClassesController", urlPatterns = {"/admin/classes"})
public class ClassesController extends HttpServlet {
    private final ClassesService classesService;

    public ClassesController() {
        this.classesService = new ClassesService();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");

        if ("edit".equals(action)) {
            handleEditRequest(request, response);
        } else if ("delete".equals(action)) {
            handleDeleteRequest(request, response);
        } else if ("listStudents".equals(action)) {
            handleListStudentsRequest(request, response);
        } else {
            handleListRequest(request, response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");

        if ("add".equals(action)) {
            handleAddRequest(request, response);
        } else if ("update".equals(action)) {
            handleUpdateRequest(request, response);
        }
    }

    private void handleListRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Classes> classes = classesService.getAllClasses();
        request.setAttribute("classes", classes);
        request.getRequestDispatcher("/views/admin/classes.jsp").forward(request, response);
    }

    private void handleAddRequest(HttpServletRequest request, HttpServletResponse response) throws IOException {
        Classes cls = new Classes();
        cls.setClassName(request.getParameter("ClassName"));
        cls.setTeacherID(Integer.parseInt(request.getParameter("TeacherID")));

        if (classesService.addClass(cls)) {
            response.sendRedirect("/admin/classes?action=list&success=Class added successfully");
        } else {
            response.sendRedirect("/admin/classes?action=add&error=Failed to add class");
        }
    }

    private void handleEditRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int classId = Integer.parseInt(request.getParameter("id"));
        Classes cls = classesService.getClassById(classId);
        request.setAttribute("class", cls);
        request.getRequestDispatcher("/views/admin/editClass.jsp").forward(request, response);
    }

    private void handleUpdateRequest(HttpServletRequest request, HttpServletResponse response) throws IOException {
        int classId = Integer.parseInt(request.getParameter("id"));
        Classes cls = new Classes();
        cls.setClassId(classId);
        cls.setClassName(request.getParameter("ClassName"));
        cls.setTeacherID(Integer.parseInt(request.getParameter("TeacherID")));

        if (classesService.updateClass(cls)) {
            response.sendRedirect("/admin/classes?action=list&success=Class updated successfully");
        } else {
            response.sendRedirect("/admin/classes?action=edit&id=" + classId + "&error=Failed to update class");
        }
    }

    private void handleDeleteRequest(HttpServletRequest request, HttpServletResponse response) throws IOException {
        int classId = Integer.parseInt(request.getParameter("id"));
        if (classesService.deleteClass(classId)) {
            response.sendRedirect("/admin/classes?action=list&success=Class deleted successfully");
        } else {
            response.sendRedirect("/admin/classes?action=list&error=Failed to delete class");
        }
    }

    private void handleListStudentsRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int classId = Integer.parseInt(request.getParameter("classId"));
        List<Student> students = classesService.getStudentsByClassId(classId);
        request.setAttribute("students", students);
        request.setAttribute("totalStudents", students.size());
        request.getRequestDispatcher("/views/admin/classStudents.jsp").forward(request, response);
    }
}