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
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
</head>
<body>
<style>
    .hh {
        background: #4cae4c;
        width: 100%;
        color: #fff;
        text-align: center;
    }
</style>
<div class="container mt-4">
    <h1 class="hh">Teacher Details</h1>
    <table class="table table-bordered mt-4">
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
            <td>${teacher.totalStudents}</td>
        </tr>
    </table>
    <a href="/admin/teachers" class="btn btn-secondary mt-4">Back to Teachers List</a>
</div>

<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>