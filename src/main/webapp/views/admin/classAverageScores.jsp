<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>Class Average Scores</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
</head>
<body>
<div class="container mt-5">
    <h1>Class Average Scores</h1>
    <table class="table table-bordered table-striped">
        <thead class="thead-light">
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
    <a href="/admin/teachers" class="btn btn-primary">Back to Teachers List</a>
</div>
</body>
</html>