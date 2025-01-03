<%--
  Created by IntelliJ IDEA.
  User: Your PC
  Date: 03/01/2025
  Time: 22:22 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>Teacher Details</title>
    <link rel="stylesheet" type="text/css" href="/styles/viewTeacher.css">
</head>
<body>
<h1>Teacher Details</h1>
<table border="1">
    <tr>
        <th>Teacher ID</th>
        <td>${teacher.teacherId}</td>
    </tr>
    <tr>
        <th>Full Name</th>
        <td>${teacher.fullName}</td>
    </tr>
    <tr>
        <th>Email</th>
        <td>${teacher.email}</td>
    </tr>
    <tr>
        <th>Phone Number</th>
        <td>${teacher.phoneNumber}</td>
    </tr>
    <tr>
        <th>Total Students</th>
        <td>${teacher.totalStudents}</td> <!-- Display total students -->
    </tr>
</table>
<a href="/admin/teachers">Back to Teachers List</a>
</body>
</html>
