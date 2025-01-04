<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Class Students</title>
    <link rel="stylesheet" type="text/css" href="/styles/admin.css">
</head>
<body>
<header>
    <div class="header-container">
        <h1>Class Students</h1>
        <a href="/admin/classes?action=list" class="back-button">Back to Classes</a>
    </div>
</header>

<main>
    <div class="content-container">
        <h2>Total Students: ${totalStudents}</h2>
        <table>
            <thead>
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
</body>
</html>