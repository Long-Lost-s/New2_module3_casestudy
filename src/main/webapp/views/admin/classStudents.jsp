<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Class Students</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
</head>
<body>
<header class="bg-primary text-white p-3 mb-4">
    <div class="container">
        <h1>Class Students</h1>
        <a href="/admin/classes?action=list" class="btn btn-secondary">Back to Classes</a>
    </div>
</header>

<main class="container">
    <div class="content-container">
        <h2 class="mb-4">Total Students: ${totalStudents}</h2>
        <table class="table table-bordered text-center">
            <thead class="thead-dark">
            <tr>
                <th>Student ID</th>
                <th>Full Name</th>
                <th>Email</th>
                <th>Phone Number</th>
                <th>Status</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach var="student" items="${students}">
                <tr>
                    <td>${student.studentId}</td>
                    <td>${student.fullName}</td>
                    <td>${student.email}</td>
                    <td>${student.phoneNumber}</td>
                    <td>${student.status}</td>
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