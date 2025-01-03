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
    <link rel="stylesheet" type="text/css" href="/styles/classAverageScores.css">
</head>
<body>
<h1>Class Average Scores</h1>
<table border="1">
    <thead>
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
<a href="/admin/teachers">Back to Teachers List</a>
</body>
</html>