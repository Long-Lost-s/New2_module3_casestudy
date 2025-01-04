<%--
  Created by IntelliJ IDEA.
  User: Your PC
  Date: 03/01/2025
  Time: 23:30 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
  <title>Edit Teacher</title>
  <link rel="stylesheet" type="text/css" href="/styles/editTeacher.css">
</head>
<body>
<h1>Edit Teacher</h1>
<form action="/admin/teachers?action=edit" method="post">
  <input type="hidden" name="teacherId" value="${teacher.teacherId}">
  <label for="fullName">Full Name:</label>
  <input type="text" id="fullName" name="fullName" value="${teacher.fullName}" required><br>
  <label for="email">Email:</label>
  <input type="email" id="email" name="email" value="${teacher.email}" required><br>
  <label for="phoneNumber">Phone Number:</label>
  <input type="text" id="phoneNumber" name="phoneNumber" value="${teacher.phoneNumber}" required><br>
  <button type="submit">Update Teacher</button>
</form>
<a href="/admin/teachers">Back to Teachers List</a>
</body>
</html>
