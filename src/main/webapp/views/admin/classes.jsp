<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Manage Classes</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
</head>
<body>
<header class="bg-primary text-white p-3 mb-4">
    <div class="container">
        <h1>Manage Classes</h1>
        <a href="/admin/admin_dashboard" class="btn btn-secondary">Back to Dashboard</a>
    </div>
</header>

<main class="container">
    <div class="content-container">
        <h2 class="mb-4">Class List</h2>
        <table class="table table-bordered text-center">
            <thead class="thead-dark">
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
                        <a href="/admin/classes?action=listStudents&classId=${cls.classId}" class="btn btn-info btn-sm">View Students</a>
                    </td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </div>
</main>

<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>