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
        <table class="class-list-table">
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
                        <a href="/admin/classes?action=listStudents&classId=${cls.classId}" class="view-link">View Students</a>
                    </td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </div>
</main>
</body>
</html>
