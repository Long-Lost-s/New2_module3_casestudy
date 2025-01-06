<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
  <title>Student Dashboard</title>
  <link rel="stylesheet" type="text/css" href="/style.css">
</head>
<body>
<h1>Welcome to Student Dashboard</h1>
<nav>
  <ul>
    <li><a href="/viewAllStudentScores?username=${sessionScope.username}">View My Classes</a></li>
    <li><a href="/logout">Logout</a></li>
  </ul>
</nav>
<c:out value="${sessionScope.username}" />
</body>
</html>