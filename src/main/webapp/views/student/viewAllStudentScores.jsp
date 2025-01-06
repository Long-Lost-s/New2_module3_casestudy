<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>View All Student Scores</title>
    <link rel="stylesheet" type="text/css" href="/style.css">
    <style>
        .select-container {
            padding: 10px;
            display: flex;
            align-items: center;
            gap: 10px;
        }
        select {
            width: 100%;
            max-width: 250px;
            padding: 5px;
            font-size: 15px;
            outline: none;
            cursor: pointer;
        }
        select p {
            margin: 0;
            white-space: nowrap;
        }
    </style>
</head>
<body>
<h1>All Student Scores</h1>
<a href="/views/student/dashboard.jsp">Back to Dashboard</a>

    <div class="select-container">
        <p>Học viên: </p>
        <select id="studentId" name="studentId" onchange="getStudentById()">
            <option value="%"></option>
            <c:forEach var="student" items="${studentNames}">
                <option value="${student.getStudentId()}">
                    <c:out value="${student.getStudentName()}"/>
                </option>
            </c:forEach>
        </select>
    </div>
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

    <script>
        let elementSelectId = document.getElementById("studentId");

        function getStudentById() {
            let studentId = elementSelectId.value;
            window.location.href = "/viewAllStudentScores?studentId=" + studentId;
        }

        function setSelectIdOption() {
            elementSelectId.value = "<c:out value="${studentId}"/>";
        }

        setSelectIdOption();
    </script>
</body>
</html>