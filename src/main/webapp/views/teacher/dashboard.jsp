<%--
  Created by IntelliJ IDEA.
  User: DELL
  Date: 1/2/2025
  Time: 9:25 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
  <title>Teacher Dashboard</title>
  <link rel="stylesheet" type="text/css" href="/style.css">
</head>
<body>
<h1>Welcome to Teacher Dashboard</h1>
<nav>
  <ul>
    <li><a href="/views/teacher/listStudent.jsp">My Classes</a></li>
    <li><a href="/views/teacher/editStudentStatus.jsp">View Students</a></li>
    <li><a href="/logout">Logout</a></li>
  </ul>
</nav>
</body>
</html>
