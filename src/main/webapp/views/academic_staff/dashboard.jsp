<%--
  Created by IntelliJ IDEA.
  User: DELL
  Date: 1/2/2025
  Time: 9:24 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
  <title>Academic Staff Dashboard</title>
  <link rel="stylesheet" type="text/css" href="/style.css">
</head>
<body>
<h1>Welcome to Academic Staff Dashboard</h1>
<nav>
  <ul>
    <li><a href="/views/academic_staff/listStudentScores.jsp">Manage Classes</a></li>
    <li><a href="/views/academic_staff/editStudentScore.jsp">Manage Students</a></li>
    <li><a href="/logout">Logout</a></li>
  </ul>
</nav>
</body>
</html>

