<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>View All Student Scores</title>
    <link rel="stylesheet" type="text/css" href="/style.css">
</head>
<body>
<h1>All Student Scores</h1>
<a href="/views/student/dashboard.jsp">Back to Dashboard</a>

<c:if test="${not empty students}">
    <table>
        <thead>
        <tr>
            <th>Student Name</th>
            <th>Subject</th>
            <th>Theory Score</th>
            <th>Practice Score</th>
            <th>Average Score</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach var="student" items="${students}">
            <c:forEach var="score" items="${student.scores}">
                <tr>
                    <td>${student.fullName}</td>
                    <td>${score.subjectName}</td>
                    <td>${score.theoryScore}</td>
                    <td>${score.practiceScore}</td>
                    <td>${score.averageScore}</td>
                </tr>
            </c:forEach>
        </c:forEach>
        </tbody>
    </table>
</c:if>
</body>
</html>