<%--
  Created by IntelliJ IDEA.
  User: Your PC
  Date: 04/01/2025
  Time: 00:47 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>Class Average Scores</title>
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
    <h1 class="text-center mb-4 hh">Class Average Scores</h1>
    <table class="table table-bordered text-center">
        <thead class="thead-dark">
        <tr>
            <th>Class ID</th>
            <th>Class Name</th>
            <th>Average Score</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach var="classAverageScore" items="${averageScores}">
            <tr>
                <td>${classAverageScore.classId}</td>
                <td>${classAverageScore.className}</td>
                <td>${classAverageScore.averageScore}</td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
    <a href="/admin/teachers" class="btn btn-secondary mt-4">Back to Teachers List</a>
</div>

<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>