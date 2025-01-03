<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>Teachers List</title>
    <link rel="stylesheet" type="text/css" href="/styles/teachers.css">
</head>
<body>
<h1>Teachers List</h1>

<!-- Form for adding a new teacher -->
<h2>Add Teacher</h2>
<form action="/admin/teachers?action=add" method="post" accept-charset="UTF-8">
    <label for="addFullName">Full Name:</label>
    <input type="text" id="addFullName" name="fullName" required><br>
    <label for="addEmail">Email:</label>
    <input type="email" id="addEmail" name="email" required><br>
    <label for="addPhoneNumber">Phone Number:</label>
    <input type="text" id="addPhoneNumber" name="phoneNumber" required><br>
    <button type="submit">Add Teacher</button>
</form>

<!-- Table displaying the list of teachers -->
<h2>Teachers List</h2>
<table border="1">
    <thead>
    <tr>
        <th>Teacher ID</th>
        <th>Full Name</th>
        <th>Email</th>
        <th>Phone Number</th>
        <th>Total Students</th>
        <th>Actions</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach var="teacher" items="${teachers}">
        <tr>
            <td>${teacher.teacherId}</td>
            <td>${teacher.fullName}</td>
            <td>${teacher.email}</td>
            <td>${teacher.phoneNumber}</td>
            <td>${teacher.totalStudents}</td>
            <td>
                <a href="/admin/teachers?action=view&id=${teacher.teacherId}">View</a>
                <a href="/admin/teachers?action=edit&id=${teacher.teacherId}">Edit</a>
                <a href="/admin/teachers?action=delete&id=${teacher.teacherId}" onclick="return confirm('Are you sure you want to delete this teacher?');">Delete</a>
            </td>
        </tr>
    </c:forEach>
    </tbody>
</table>

<!-- Form for editing a teacher (only visible when editing) -->
<c:if test="${not empty teacher}">
    <h2>Edit Teacher</h2>
    <form action="/admin/teachers?action=edit" method="post" accept-charset="UTF-8">
        <input type="hidden" name="teacherId" value="${teacher.teacherId}">
        <label for="editFullName">Full Name:</label>
        <input type="text" id="editFullName" name="fullName" value="${teacher.fullName}" required><br>
        <label for="editEmail">Email:</label>
        <input type="email" id="editEmail" name="email" value="${teacher.email}" required><br>
        <label for="editPhoneNumber">Phone Number:</label>
        <input type="text" id="editPhoneNumber" name="phoneNumber" value="${teacher.phoneNumber}" required><br>
        <button type="submit">Update Teacher</button>
    </form>
</c:if>
<div class="btn btn1">
    <a href="/admin/teachers?action=averageScores">View Class Average Scores</a>
</div>
<div class="btn btn1">
    <a href="/admin/teachers?action=viewStudentScores">View Student Average Scores</a>
</div>
</body>
</html>