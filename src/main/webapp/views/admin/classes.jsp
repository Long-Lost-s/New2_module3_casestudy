<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Manage Classes</title>
    <link rel="stylesheet" type="text/css" href="/styles/admin.css">
</head>
<body>
<header>
    <div class="header-container">
        <h1>Manage Classes</h1>
        <a href="/views/admin/admin_dashboard.jsp" class="back-button">Back to Dashboard</a>
    </div>
</header>

<main>
    <div class="content-container">
        <h2>Class List</h2>
        <table>
            <thead>
            <tr>
                <th>Class ID</th>
                <th>Class Name</th>
                <th>Teacher ID</th>
                <th>Actions</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach var="cls" items="${classes}">
                <tr>
                    <td>${cls.classId}</td>
                    <td>${cls.className}</td>
                    <td>${cls.teacherID}</td>
                    <td>
                            <%--            <a href="/admin/classes?action=edit&id=${cls.classId}">Edit</a>--%>
                            <%--            <a href="/admin/classes?action=delete&id=${cls.classId}" onclick="return confirm('Are you sure you want to delete this class?');">Delete</a>--%>
                        <a href="/admin/classes?action=listStudents&classId=${cls.classId}">View Students</a>
                    </td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
        <%--    <a href="/admin/classes?action=add" class="add-button">Add New Class</a>--%>
    </div>
</main>
</body>
</html>